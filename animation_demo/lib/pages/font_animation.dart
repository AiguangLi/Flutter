import 'package:flutter/material.dart';
import 'package:plugins/components/app_bar_factory.dart';

class FontAnimation extends StatefulWidget {
  FontAnimation({Key key}) : super(key: key);

  @override
  _FontAnimationState createState() => _FontAnimationState();
}

class _FontAnimationState extends State<FontAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> tween;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    tween = Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() {
        setState(() {
          print('Animation value: ${tween.value}');
        });
      });

    //执行动画
    _startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Font Zoom Animation'),
      body: GestureDetector(
        onTap: () {
          _reverseAnimation();
        },
        child: Center(
          child: Container(
            alignment: Alignment.center,
            width: 400,
            height: 400,
            child: Text('字体放大',
                style: TextStyle(fontSize: 40 * animationController.value)),
          ),
        ),
      ),
    );
  }

  _startAnimation() {
    setState(() {
      animationController.forward(from: 0.0);
    });
  }

  _reverseAnimation() {
    setState(() {
      animationController.reverse(from: 1.0);
    });
  }

  @override
  void dispose() {
    //必须销毁动画controller
    animationController.dispose();
    super.dispose();
  }
}
