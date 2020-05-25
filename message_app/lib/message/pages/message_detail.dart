import 'package:flutter/material.dart';
import 'package:plugins/components/app_bar_factory.dart';
import 'package:provider/provider.dart';

import '../view_model/message_store.dart';
import '../../repository/global_service_repository.dart';

class MessageDetailPage extends StatelessWidget {
  final String messageId;
  const MessageDetailPage({Key key, this.messageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GlobalServiceRepository.getService<MessageStore>(),
      child: _MessageDetail(messageId: messageId),
    );
  }
}

class _MessageDetail extends StatefulWidget {
  final String messageId;
  _MessageDetail({Key key, this.messageId}) : super(key: key);

  @override
  _MessageDetailState createState() => _MessageDetailState();
}

class _MessageDetailState extends State<_MessageDetail> {

  @override
  void initState() {
    super.initState();

    //final store = Provider.of<MessageStore>(context);
    //store.getMessageDetail(widget.messageId);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final store = Provider.of<MessageStore>(context);
    store.getMessageDetail(widget.messageId);
  }
  
  // @override
  // void didUpdateWidget (Widget oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   final store = Provider.of<MessageStore>(context);
  //   store.getMessageDetail(widget.messageId);
  // }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MessageStore>(context);
    return Scaffold(
       appBar: AppBarFactory.buildCenterAppBar('Message Detail'),
       body: Center(
         child: Text(store.message != null ? store.message.recentMessage : '加载中'),
       ),
    );
  }
}