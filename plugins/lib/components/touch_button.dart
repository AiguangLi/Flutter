import 'package:flutter/material.dart';

class TouchButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final bool isfeed;
  final Color backgroundColor;
  TouchButton({Key key, @required this.child, @required this.onPressed, this.isfeed: true, this.backgroundColor: const Color(0xfff1f1f1)}) : super(key: key);

  @override
  _TouchButtonState createState() => _TouchButtonState();
}

class _TouchButtonState extends State<TouchButton> {
  Color _color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       child: Container(
         color: _color,
         child: widget.child,
       ),
       onTap: widget.onPressed,
       onPanDown: (d) {
         if (widget.isfeed) {
           setState(() {
             _color = widget.backgroundColor;
           });
         }
       },
       onPanCancel: () {
         setState(() {
           _color = Colors.transparent;
         });
       },
    );
  }
}