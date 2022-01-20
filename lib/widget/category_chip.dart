import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final double height;
  final double width;
  final String text;

  const CategoryChip(
      {required this.height, required this.width, required this.text, Key? key})
      : super(key: key);

  Color get color {
    if (text == 'CHRISTMAS') {
      return Colors.red;
    } else if (text == 'EASTER') {
      return Colors.pink;
    } else if (text == 'FAITH') {
      return Colors.teal;
    } else if (text == 'GENERAL') {
      return Colors.yellow;
    } else if (text == 'LOVE') {
      return Colors.indigo;
    } else if (text == 'FATHERS') {
      return Colors.cyanAccent;
    } else if (text == 'MOTHERS') {
      return Colors.cyanAccent;
    } else if (text == 'REPENTANCE') {
      return Colors.cyanAccent;
    } else if (text == 'FORGIVENESS') {
      return Colors.cyanAccent;
    } else {
      return Colors.purple;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 5))
        ],
        borderRadius: BorderRadius.circular(20),
        color: color.withOpacity(0.9),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ),
    );
  }
}
