import 'package:flutter/material.dart';

class GlobalConstant {
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static const Color PRIMARY_COLOR = Color(0xFF1296DB);
  static const Color PAGE_BACKGROUND_COLOR = Color(0xFFF1F1F1);
  static const Color DESELECTED_COLOR = Color(0xFF8A8A8A);
}