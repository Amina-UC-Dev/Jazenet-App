import 'package:flutter/material.dart';

class Styles {
  normalS({
    required FontWeight fontW,
    required double fontS,
    required Color color,
  }) {
    return TextStyle(
      fontSize: fontS,
      fontWeight: fontW,
      color: color,
    );
  }
}



