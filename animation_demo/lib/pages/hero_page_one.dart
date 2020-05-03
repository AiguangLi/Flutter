import 'package:flutter/material.dart';
import 'package:plugins/components/app_bar_factory.dart';
import 'package:plugins/plugins.dart';

class HeroPageOne extends StatefulWidget {
  HeroPageOne({Key key}) : super(key: key);

  @override
  _HeroPageOne createState() => _HeroPageOne();
}

class _HeroPageOne extends State<HeroPageOne> {
  String _imageUrl =
      'http://t9.baidu.com/it/u=2268908537,2815455140&fm=79&app=86&f=JPEG?w=1280&h=719';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Hero Page One'),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _imageUrl =
                'http://t9.baidu.com/it/u=1307125826,3433407105&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1589128813&t=dd8bb83ad1940fc5e24c6ad5bff1a4a1';
          });
        },
        child: Hero(
          child: Center(
            child: Container(
              child: Image.network(
                _imageUrl,
                fit: BoxFit.cover,
              ),
              width: 400,
              height: 200,
            ),
          ),
          tag: 'Page One',
          createRectTween: (Rect begin, Rect end) {
            return Tween<Rect>(
              begin: Rect.fromLTWH(0, 0, 400, 200),
              end: Rect.fromLTWH(100, 50, 400, 200),
            );
          },
        ),
      ),
    );
  }
}
