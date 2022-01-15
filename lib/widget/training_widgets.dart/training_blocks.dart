import 'package:flutter/material.dart';

class TrainingBlock extends StatelessWidget {
  final Color color;
  const TrainingBlock(this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
