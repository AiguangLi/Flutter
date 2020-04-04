import 'package:flutter/material.dart';

/*
Image用于展示图片，常用的包括从资源包加载或从网络加载。
Image如果需要支持圆角矩形，需要通过Container或CircleAvatar来实现圆角
 */
class ImageDemo extends StatelessWidget {
    final String title;
    ImageDemo({Key key, this.title});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text( this.title)),
            body: Center(
                child: Column(
                    children: <Widget>[
                        Image.network(
                            'http://5b0988e595225.cdn.sohucs.com/q_70,c_zoom,w_640/images/20200220/1f28da011dd84d2cadede15b5f21d38d.jpeg',
                            width: 200,
                            fit: BoxFit.fitWidth,
                        ),
                        Image.asset(
                            'images/bmw.png',
                            width: 80,
                            fit: BoxFit.fitWidth,
                        ),
                        Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4099493327,2236798276&fm=26&gp=0.jpg'),
                                    fit: BoxFit.cover,
                                ),
                                shape: BoxShape.circle,
                            ),
                        ),
                        Container(
                            width: 320,
                            height: 212,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1883407631,4056411171&fm=26&gp=0.jpg'),
                                    fit: BoxFit.cover,
                                ),
                                shape: BoxShape.rectangle,              // <-- 这里需要设置为 rectangle
                                borderRadius: new BorderRadius.all(
                                    const Radius.circular(10.0),        // <-- rectangle 时，BorderRadius 才有效
                                ),
                            ),
                        ),
                    ],
                ),
            )
        );

  }
}