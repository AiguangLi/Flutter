import 'package:flutter/material.dart';
import 'package:plugins/components/app_bar_factory.dart';

class MaskAnimation extends StatefulWidget {
  MaskAnimation({Key key}) : super(key: key);

  @override
  _MaskAnimationState createState() => _MaskAnimationState();
}

class _MaskAnimationState extends State<MaskAnimation>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _sizeAnimation;
  Animation<BorderRadius> _borderRadiusAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _sizeAnimation = Tween<double>(begin: 50.0, end: 200.0).animate(
        CurvedAnimation(curve: Curves.ease, parent: _animationController));
    _borderRadiusAnimation = BorderRadiusTween(
            begin: BorderRadius.circular(75.0), end: BorderRadius.circular(0.0))
        .animate(
            CurvedAnimation(curve: Curves.ease, parent: _animationController));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Mask Animation'),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return Stack(
            children: <Widget>[
              Center(
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  color: Colors.lightGreen,
                  alignment: Alignment.center,
                  child: Text(
                    'Mask Animation',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: _sizeAnimation.value,
                  height: _sizeAnimation.value,
                  decoration: BoxDecoration(
                    color: Colors.black12.withAlpha(128),
                    borderRadius: _borderRadiusAnimation.value,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
