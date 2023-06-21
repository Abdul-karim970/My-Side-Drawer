import 'package:flutter/material.dart';

class DrawerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    return Path()
      ..moveTo(-width * 0.1, height * 0.1)
      ..lineTo(0, height * 1.1)
      ..lineTo(width * 1.1, height * 1.1)
      ..lineTo(width, -height * 0.5)
      ..lineTo(width * 0.18, 0)
      ..lineTo(width * 0.18, height * 0.1)
      ..lineTo(0, height * 0.1)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
