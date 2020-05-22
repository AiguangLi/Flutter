import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';

import '../view_model/message_store.dart';
import '../components/message_item.dart';

import '../../repository/global_service_repository.dart';

class MessageListPage extends StatelessWidget {
  const MessageListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GlobalServiceRepository.getService<MessageStore>(),
      child: _MessageList(),
    );
  }
}

class _MessageList extends StatefulWidget {
  _MessageList({Key key}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

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
