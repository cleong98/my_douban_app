import 'package:flutter/material.dart';

class MyDashedLine extends StatelessWidget {
  final Axis axis;
  final double dashedwidth;
  final double dashedHeight;
  final int count;
  final Color color;

  MyDashedLine({
    this.axis = Axis.horizontal,
    this.dashedwidth = 1,
    this.dashedHeight = 1,
    this.count = 10,
    this.color = Colors.red
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
        direction: axis,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(count, (_) {
          return SizedBox(
            width: dashedwidth,
            height: dashedHeight,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: color
              ),
            ),
          );
        })
    );
  }
}


