import 'package:flutter/material.dart';
import 'package:message_app/global_constant.dart';
import 'package:plugins/plugins.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //margin: EdgeInsets.only(top: 22),
        child: Column(
          children: <Widget>[
            _getSearchBar(),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text('热门搜索',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getText('微博'),
                  _getText('微信'),
                  _getText('体育'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getText('公众号'),
                  _getText('百家号'),
                  _getText('头条号'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSearchBar() {
    return Container(
      padding: EdgeInsets.only(top: 22, bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            child: TouchButton(
              child: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                RouteManager.router.pop(context);
              },
              backgroundColor: GlobalConstant.PRIMARY_COLOR,
            ),
            width: 44,
            height: 44,
          ),
          Expanded(
            child: TextField(
              focusNode: _requestFocusNode(),
              style: TextStyle(color: Colors.white, fontSize: 14),
              onChanged: (String text) {},
              decoration: InputDecoration(
                  hintText: '输入要搜索的内容',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white38)),
            ),
          ),
          Container(
            child: TouchButton(
                child: Icon(Icons.mic, color: Colors.white),
                onPressed: () {},
                backgroundColor: GlobalConstant.PRIMARY_COLOR),
            width: 44,
            height: 44,
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xFF1296db),
      ),
    );
  }

  //获取输入焦点
  _requestFocusNode() {
    FocusScope.of(context).requestFocus(_focusNode);
    return _focusNode;
  }

  TouchButton _getText(String text) {
    return TouchButton(
      child: Text(
        text,
        style: TextStyle(fontSize: 14.0, color: Colors.lightBlue),
      ),
      onPressed: () {},
    );
  }
}
