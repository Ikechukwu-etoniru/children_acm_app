import 'package:flutter/material.dart';
import '/widget/word_container.dart';

class DashboardTopbar extends StatelessWidget {
  final double barHeight;
  DashboardTopbar(this.barHeight, {Key? key}) : super(key: key);

  final List<Color> _colorList = [
    const Color(0xff40E0D0),
    const Color(0xffFAFA33),
    const Color(0xff800020)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: barHeight,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Color(0xff3c7b77), blurRadius: 1)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Word for the day',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 27,
                wordSpacing: 2,
                color: Colors.black54),
          ),
          const Text(
            'Grow everyday in Christ',
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 16,
              color: Color(0xff3c7b77),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  WordContainer(barHeight * 0.3, _colorList[index]),
            ),
          )
        ],
      ),
    );
  }
}
