import 'package:flutter/material.dart';
import 'package:message_app/message/impl/message_service_impl.dart';
import 'package:message_app/message/message_item.dart';
import 'package:message_app/message/message_model.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:message_app/models/list_pager.dart';
import 'package:message_app/models/list_vo.dart';

class MessageList extends StatefulWidget {
  MessageList({Key key}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  List<MessageModel> messageData;
  ListPager pager;

  EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh(
        controller: _controller,
        onRefresh: () async {
          ListVO<MessageModel> newData =
              await MessageServiceImpl().listMessage(1, 20);
          messageData = newData?.listItems;
          pager = newData?.pager;
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {});
            _controller.resetLoadState();

            if (pager == null || pager?.nextPage == pager?.currentPage) {
              _controller.finishLoad(noMore: true);
            }
          });
        },
        onLoad: () async {
          if (pager.nextPage > pager.currentPage) {
            ListVO<MessageModel> newData = await MessageServiceImpl()
                .listMessage(pager.nextPage, pager.paegSize);
            messageData.addAll(newData?.listItems);
            pager = newData.pager;

            await Future.delayed(Duration(seconds: 2), () {
              setState(() {});
              _controller.finishLoad(
                  noMore: pager.toalPage == pager.currentPage);
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
                child: Text('No Data Available!'),
              ),
      ),
    );
  }
}
