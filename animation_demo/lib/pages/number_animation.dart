import 'package:flutter/material.dart';
import 'package:plugins/components/app_bar_factory.dart';

class NumberAnimation extends StatefulWidget {
  NumberAnimation({Key key}) : super(key: key);

  @override
  _NumberAnimationState createState() => _NumberAnimationState();
}

class _NumberAnimationState extends State<NumberAnimation>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<int> _numberAnimation;
  Animation<Color> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _numberAnimation = IntTween(begin: 0, end: 100).animate(
        CurvedAnimation(curve: Curves.easeOut, parent: _animationController))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        }
      });

      _colorAnimation = ColorTween(
        begin: Colors.green, end: Colors.blue
      ).animate(
        CurvedAnimation(curve: Curves.linear, parent: _animationController)
      );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Number Animation'),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return Center(
            child: Text(
              _numberAnimation.value.toString(),
              style: TextStyle(
                  color: _colorAnimation.value,
                  fontSize: 48.0,
                  fontWeight: FontWeight.w500),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }
}
