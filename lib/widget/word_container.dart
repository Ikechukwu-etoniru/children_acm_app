import 'package:flutter/material.dart';
class WordContainer extends StatelessWidget {
  final double containerSize;
  final Color color;
  const WordContainer(this.containerSize, this.color,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerSize,
      width: containerSize + 40,

      child: Stack(
        children: [
          Container(),
          Container(),
        ],
      ),
      
    );
  }
}