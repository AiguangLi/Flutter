import 'package:flutter/material.dart';
import 'package:storage_demo/components/app_bar_factory.dart';
import 'package:storage_demo/utils/file_storage.dart';
import 'dart:io';

class FileStorageDemo extends StatefulWidget {
  FileStorageDemo({Key key}) : super(key: key);

  @override
  _FileStorageDemoState createState() => _FileStorageDemoState();
}

class _FileStorageDemoState extends State<FileStorageDemo> {
  TextEditingController contentEditController;
  bool isRead;

  @override
  void initState() {
    super.initState();
    isRead = true;
    contentEditController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('File Storage Demo'),
      body: Center(
          child: Container(
        height: 600,
        child: Column(
          children: <Widget>[
            Expanded(
              child: getTextInput('输入要存储的内容', (value) {}, contentEditController,
                  null, false, null, 4),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child:
                      getTextButton(isRead ? '读取' : '存储', Colors.lightBlue, () {
                    handleTextStorage('log.txt');
                  }),
                ),
                getTextButton('清空', Colors.blueGrey, () {
                    clearTextAndFile('log.txt');
                }),
              ],
            )
          ],
        ),
      )),
    );
  }

  void clearTextAndFile(String fileName) async {
    await FileStorage.writeToFileInDocumentDirectory(
          fileName, '', FileMode.write);
      setState(() {
        contentEditController.text = '';
        isRead = false;
      });
  }

  void handleTextStorage(String fileName) async {
    if (isRead) {
      String content =
          await FileStorage.readFromFileInDocumentDirectory(fileName);
      setState(() {
        contentEditController.text = content;
        isRead = false;
      });
    } else {
      await FileStorage.writeToFileInDocumentDirectory(
          fileName, contentEditController.text);
      setState(() {
        isRead = true;
      });
    }
  }

  Widget getTextInput(
      String placeholder, Function onChanged, TextEditingController controller,
      [String iconPath,
      bool isPassword = false,
      String label,
      int maxLines = 1]) {
    return Container(
      height: 50,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        onChanged: onChanged,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: placeholder,
          labelText: label,
          prefixIcon: iconPath == null
              ? null
              : Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(iconPath, width: 12, height: 12),
                ),
        ),
      ),
    );
  }

  Widget getTextButton(String title, Color bgColor, Function onPressed) {
    return Container(
      height: 50,
      //width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      ),
    );
  }
}
