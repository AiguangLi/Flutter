import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:layout_demo/components/app_bar_factory.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:layout_demo/components/custom_swiper.dart';

class CompisteDemo extends StatelessWidget {
  const CompisteDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = ['images/villa.jpg', 'images/building.jpg'];
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Composite Demo'),
      body: ListView(
        children: <Widget>[
          ///Swiper需要指定高度，否则会与ListView冲突
          CustomSwiper.imageSwiper(imagePaths, 124, 225, SwiperImageSource.local),
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
          getBillFee(),
          getDynamic(),
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
                    'A Flutter Composite Demo',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16.0),
                  ),
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 5.0),
                ),
                Container(
                  child: Text(
                    'Make App Development More Simple.',
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
          margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
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

      ///shrinkWrap和physics属性设置用于解决ListView嵌套GridView冲突，禁止GridView滚动
      shrinkWrap: true,
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

  DecoratedBox getBillFee() {
    return DecoratedBox(
      child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                '欠费总额',
                style: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
              Text('￥13861.5',
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
            ],
          )),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 1.0),
              colors: <Color>[
            Color(0xFFF3AB61),
            Color(0xFFF09064),
            Color(0xFFEC7C66),
            Color(0xFFE9616A),
          ])),
    );
  }

  ListView getDynamic() {
    List<DynamicEvent> dynamicEvents = [
      DynamicEvent(
          time: '2020-04-10 10:12',
          title: '小区四害消杀通知',
          type: '公告',
          bgColor: Colors.lightGreen),
      DynamicEvent(
          time: '2020-04-10 12:12',
          title: '你的报修有新的回复',
          type: '报修',
          bgColor: Colors.orange),
      DynamicEvent(
          time: '2020-04-10 13:12',
          title: '你的报事有新的回复',
          type: '报事',
          bgColor: Colors.lightBlue),
    ];

    return ListView.builder(
      ///嵌套时需要设置shrinkWrap和physics属性
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: dynamicEvents.length,
      itemBuilder: (context, index) => dynamicListItem(dynamicEvents[index]),
    );
  }

  ///动态事件列表单元组件
  Widget dynamicListItem(DynamicEvent event) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF1F1F1),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0xFFCCCCCC),
              blurRadius: 2.0,
              spreadRadius: 1.0,
              offset: Offset(1.0, 1.0)),
        ],
      ),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: getDynamicContent(event),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFFBBBBBB),
          ),
        ],
      ),
    );
  }

  ///动态事件内容组件，包括类型标签，标题和时间
  Widget getDynamicContent(DynamicEvent event) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: Text(event.type,
                  style: TextStyle(color: Colors.white, fontSize: 14.0)),
              width: 40,
              height: 24.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                color: event.bgColor,
              ),
            ),
            Expanded(
              child: Container(
                child: Text(
                  event.title,
                  style: TextStyle(fontSize: 16.0),
                ),
                padding: EdgeInsets.only(left: 5.0),
              ),
            ),
          ],
        ),
        Container(
          child: Text(
            event.time,
            style: TextStyle(color: Colors.grey, fontSize: 14.0),
          ),
          margin: EdgeInsets.only(left: 0.0, top: 8.0, bottom: 8.0),
        ),
      ],
    );
  }
}

class DynamicEvent {
  final String type;
  final String title;
  final String time;
  final Color bgColor;

  DynamicEvent({this.title, this.type, this.time, this.bgColor});
}
