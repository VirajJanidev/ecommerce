import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  final double dotWidth;
  final double spacing;
  final Color color;
  final double height;

  const DottedLine({
    Key? key,
    this.dotWidth = 4.0,
    this.spacing = 4.0,
    this.color = Colors.black,
    this.height = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      int count = (constraints.maxWidth / (dotWidth + spacing)).floor();

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(count, (_) {
          return Container(
            width: dotWidth,
            height: height,
            color: color,
          );
        }),
      );
    });
  }
}
