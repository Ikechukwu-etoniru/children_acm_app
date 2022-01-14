import 'package:flutter/material.dart';
import '/screen/dashboard_screen.dart';

class DashboardBottombar extends StatelessWidget {
  final double barHeight;
  const DashboardBottombar(this.barHeight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: barHeight,
      width: deviceWidth,
      decoration: const BoxDecoration(
        color: DashboardScreen.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
