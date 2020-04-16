import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:layout_demo/components/app_bar_factory.dart';

class CompisteDemo extends StatelessWidget {
  const CompisteDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Composite Demo'),
      body: ListView(
        children: <Widget>[
          Container(
            width: 450,
            height: 248,
            child: Image.asset(
              'images/villa.jpg',
              fit: BoxFit.cover,

              ///图片填充整个父组件
            ),
          ),
          addressRow(),
          Divider(
            color: Colors.blueGrey,
            height: 1.0,
          ),
          gridButtons(),
          Divider(
            color: Colors.blueGrey,
            height: 1.0,
          ),
          Container(
            child: Text('''
            吃辣椒凤飞飞凤飞飞凤飞飞凤飞飞凤飞飞凤飞飞发发发凤飞飞凤飞飞发链接呜呜呜呜呜呜呜呜我问问
            发角落里啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦
            放假额啦啦啦啦啦啦啦啦啦啦啦
            发角落里啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦
            放假额啦啦啦啦啦啦啦啦啦啦啦
            '''),
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          ),
        ],
      ),
    );
  }

  ///地址栏
  Row addressRow() {
    return Row(
      children: <Widget>[
        Expanded(
          ///使用expanded使得子组件宽度撑满Row的空间
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, //列元素左对齐
              children: <Widget>[
                Container(
                  ///通过container控制组间间的间距
                  child: Text(
                    '风景区地址',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 5.0),
                ),
                Container(
                  child: Text(
                    '湖北省十堰市丹江口市',
                    style: TextStyle(color: Colors.grey),
                  ),
                  margin: EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 10.0),
                ),
              ]),
        ),
        Container(
          child: Icon(
            Icons.star,
            color: Colors.orange,
          ),
          margin: EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 10.0),
        ),
        Container(
          child: Text('66'),
          margin: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 10.0),
        ),
      ],
    );
  }

  GridView gridButtons() {
    List<Map<String, String>> buttons = [
      {
        'name': '手机收单',
        'image': 'images/charge.png',
      },
      {
        'name': '服务动态',
        'image': 'images/dynamic.png',
      },
      {
        'name': '人脸审核',
        'image': 'images/face.png',
      },
      {
        'name': '智能电表',
        'image': 'images/meter.png',
      },
      {
        'name': '行业资讯',
        'image': 'images/news.png',
      },
      {
        'name': '二维码',
        'image': 'images/qrcode.png',
      },
      {
        'name': '数据统计',
        'image': 'images/statistic.png',
      },
    ];
    return GridView.count(
      primary: false,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      crossAxisCount: 4,
      padding: const EdgeInsets.all(10.0),
      shrinkWrap: true, ///shrinkWrap和physics属性设置用于解决ListView嵌套GridView冲突，禁止GridView滚动
      physics: NeverScrollableScrollPhysics(),
      children: buttons.map((item) {
        return Container(
          height: 120,
          child: Column(
            children: <Widget>[
              Image.asset(
                item['image'],
                width: 60,
              ),
              Text(item['name']),
            ],
          ),
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        );
      }).toList(),
    );
  }
}
