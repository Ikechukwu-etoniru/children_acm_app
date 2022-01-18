import 'package:flutter/material.dart';

import 'word_container.dart';

class DashboardTopbar extends StatelessWidget {
  final double barHeight;
  DashboardTopbar(this.barHeight, {Key? key}) : super(key: key);

  final List<Color> _colorList = [
    const Color(0xff312c76),
    const Color(0xfffde9e5),
    const Color(0xff9897ae)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: barHeight,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Color(0xff3c7b77), blurRadius: 1)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: barHeight * 0.13,
            child: const Text(
              'Word for the day',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  wordSpacing: 2,
                  color: Colors.black54),
            ),
          ),
          SizedBox(
            height: barHeight * 0.1,
            child: const Text(
              'Grow everyday in Christ',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 16,
                color: Color(0xff3c7b77),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) =>
                  WordContainer(barHeight * 0.66, _colorList[index]),
            ),
          )
        ],
      ),
    );
  }
}
