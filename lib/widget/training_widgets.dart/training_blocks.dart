import 'package:flutter/material.dart';

class TrainingBlock extends StatelessWidget {
  final Color color;
  const TrainingBlock(this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 250,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: [
          color.withOpacity(0.5),
          color.withOpacity(0.7),
          color.withOpacity(0.9),
          color
        ], begin: Alignment.bottomRight, end: Alignment.topLeft),
      ),
    );
  }
}
