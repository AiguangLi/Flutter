import 'package:flutter/material.dart';
import 'package:plugins/plugins.dart';

class CurveAnimation extends StatefulWidget {
  CurveAnimation({Key key}) : super(key: key);

  @override
  _CurveAnimationState createState() => _CurveAnimationState();
}

class _CurveAnimationState extends State<CurveAnimation>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: _animationController))
      ..addStatusListener(_animationHandler);
  }

  _animationHandler(status) {
    if (status == AnimationStatus.completed) {
      //移除原有状态监听器
      _animation.removeStatusListener(_animationHandler);
      //重置动画
      _animationController.reset();
      //新建动画中间插值对象，实现移出效果
      _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          curve: Curves.fastOutSlowIn, parent: _animationController)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            RouteManager.router.pop(context);
          }
        }));
      _animationController.forward();
    }
  }

  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    _animationController.forward();
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Curve Animation'),
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.translationValues(
                  _animation.value * screenWidth, 0.0, 0.0),
              child: Center(
                  child: Container(
                    color: Colors.lightBlue, 
                    width: 200, 
                    height: 200)
                  ),
            );
          }),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
