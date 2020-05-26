import 'package:flutter/material.dart';
import 'package:plugins/components/app_bar_factory.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../view_model/message_store.dart';
import '../../repository/global_service_repository.dart';
import '../../utils/image_picker_util.dart';

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
  File _imageFile;

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
        child: Column(
          children: <Widget>[
            Text(store.message != null ? store.message.recentMessage : '加载中'),
            _imageFile != null
                ? SizedBox(
                    child: Image.file(_imageFile, fit: BoxFit.fill),
                    width: 200,
                    height: 200,
                  )
                : Text('选择图片'),
          ],
        ),
      ),
      floatingActionButton: FlatButton(
          onPressed: () async {
            await displayPickImageDialog(context, 200, 200, 50);
          },
          child: Icon(Icons.photo)),
    );
  }

  Future<void> displayPickImageDialog(
      BuildContext context, double width, double height, int quality) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('选择照片'),
          content: Text('从相册选择照片或拍照'),
          actions: <Widget>[
            FlatButton(
              child: const Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: const Text('从相册选取'),
              onPressed: () async {
                _imageFile = await ImagePickerUtil.pickImage(
                    ImageSource.gallery, width, height, quality);
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: const Text('拍照'),
              onPressed: () async {
                _imageFile = await ImagePickerUtil.pickImage(
                    ImageSource.camera, width, height, quality);
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
