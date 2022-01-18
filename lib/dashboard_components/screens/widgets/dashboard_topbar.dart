import 'package:flutter/material.dart';

import '/dashboard_components/screens/dashboard_screen.dart';

class DashboardTopbar extends StatelessWidget {
  final double barHeight;
  const DashboardTopbar(this.barHeight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: barHeight,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: DashboardScreen.primaryColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 3,
              spreadRadius: 5,
              offset: const Offset(1, 3))
        ],
        gradient: RadialGradient(colors: [
          DashboardScreen.primaryColor.withOpacity(0.4),
          DashboardScreen.primaryColor.withOpacity(0.6),
          DashboardScreen.primaryColor.withOpacity(0.8),
          DashboardScreen.primaryColor
        ], center: Alignment.topCenter, radius: 1),
      ),
      child: Row(children: [
        SizedBox(
          height: 160,
          width: 160,
          child: Image.asset(
            'images/leaf_pic1.png',
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(left: 5),
              height: 65,
              width: 155,
              child: const Text(
                'Grow in Christ everyday',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    wordSpacing: 1,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(left: 4),
              padding: const EdgeInsets.all(4),
              height: 30,
              width: 130,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(40),
              ),
              child: FittedBox(
                  child: Row(
                children: const [
                  Text(
                    'Verse for today',
                    style: TextStyle(color: Colors.brown),
                  ),
                  Icon(Icons.arrow_right_rounded)
                ],
              )),
            )
          ],
        )
      ]),
    );
  }
}
