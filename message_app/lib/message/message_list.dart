import 'package:flutter/material.dart';
import 'package:message_app/message/impl/message_service_impl.dart';
import 'package:message_app/message/message_item.dart';
import 'package:message_app/message/message_model.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:message_app/models/list_pager.dart';
import 'package:message_app/models/list_vo.dart';

class MessageList extends StatefulWidget {
  MessageList._({Key key}) : super(key: key);

  static MessageList _instance;

  static MessageList getSharedInstance() {
    if (_instance == null) {
      _instance = MessageList._();
    }

    return _instance;
  }

  @override
  _MessageListState createState() => _MessageListState();
}

//ToDo：数据要通过状态管理器管理，否则每次都会创建，导致每次都会刷新
class _MessageListState extends State<MessageList> {
  List<MessageModel> messageData;
  ListPager pager;
  bool _isLoaded = false;

  EasyRefreshController _controller = EasyRefreshController();
  String _indicatorText;

  @override
  void initState() {
    super.initState();
    _indicatorText = 'Loading...';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh(
        firstRefresh: !_isLoaded,
        //emptyWidget: Center(child:Text(_indicatorText)),
        controller: _controller,
        onRefresh: () async {
          ListVO<MessageModel> newData =
              await MessageServiceImpl.getSharedInstance().listMessage(1, 20);
          messageData = newData?.listItems;
          pager = newData?.pager;
          await Future.delayed(Duration(seconds: 2), () {
            _controller.resetLoadState();

            if (pager == null || pager?.nextPage == pager?.currentPage) {
              _controller.finishLoad(noMore: true);
            }

            _isLoaded = true;
            setState(() {
              if (pager.total == 0) {
                _indicatorText = 'No Data Available';
              }
            });
          });
        },
        onLoad: () async {
          if (pager.nextPage > pager.currentPage) {
            ListVO<MessageModel> newData =
                await MessageServiceImpl.getSharedInstance()
                    .listMessage(pager.nextPage, pager.paegSize);
            messageData.addAll(newData?.listItems);
            pager = newData.pager;

            await Future.delayed(Duration(seconds: 2), () {
              setState(() {});
              _controller.finishLoad(
                  noMore: pager.totalPage == pager.currentPage);
            });
          }
        },
        child: messageData != null
            ? ListView.builder(
                itemCount: messageData.length,
                itemBuilder: (context, index) {
                  return MessageItem(message: messageData[index]);
                })
            : Center(
                child: Text(_indicatorText),
              ),
      ),
    );
  }
}
