import 'package:flutter/material.dart';
import 'package:message_app/message/message_item.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:message_app/message/view_model/message_store.dart';
import 'package:provider/provider.dart';

class MessageListPage extends StatelessWidget {
  const MessageListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MessageStore(context),
      lazy: false,
      child: _MessageList(),
    );
  }
}

class _MessageList extends StatefulWidget {
  _MessageList({Key key}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

//ToDo：解决每次切换的刷新问题
class _MessageListState extends State<_MessageList> {

  EasyRefreshController _controller = EasyRefreshController();
  String _indicatorText;

  @override
  void initState() {
    super.initState();
    _indicatorText = 'Loading...';
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MessageStore>(context);
    return Scaffold(
      body: EasyRefresh(
        firstRefresh: !store.isLoaded,
        controller: _controller,
        onRefresh: () async {
          await store.getListItems(1, 20);
          _controller.finishLoad(noMore: !store.hasMoreData);
        },
        onLoad: () async {
          if (store.hasMoreData) {
            await store.getListItems(
                store.pager.nextPage, store.pager.paegSize);

            _controller.finishLoad(noMore: !store.hasMoreData);
          }
        },
        child: store.messageData != null
            ? ListView.builder(
                itemCount: store.messageData.length,
                itemBuilder: (context, index) {
                  return MessageItem(message: store.messageData[index]);
                })
            : Center(
                child: Text(_indicatorText),
              ),
      ),
    );
  }
}
