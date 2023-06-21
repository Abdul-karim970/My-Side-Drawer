import 'package:anim/shape_maker.dart';
import 'package:flutter/material.dart';

class ShapeMaker extends StatelessWidget {
  const ShapeMaker({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: ShapeMakerPainter(),
      ),
    );
  }
}
