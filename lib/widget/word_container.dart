import 'package:flutter/material.dart';

class WordContainer extends StatelessWidget {
  final double barHeight;
  final Color color;
  const WordContainer(this.barHeight, this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      height: barHeight,
      width: barHeight + (barHeight / 4),
      child: Stack(
        children: [
          Positioned(
            top: 6,
            left: 6,
            child: Container(
              height: barHeight - (barHeight / 15),
              width: barHeight + (barHeight / 4) - (barHeight / 10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Container(
            height: barHeight - (barHeight / 15),
            width: barHeight + (barHeight / 4) - (barHeight / 10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
          )
        ],
      ),
    );
  }
}
