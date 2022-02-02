import 'package:flutter/material.dart';

import '../dashboard_screen.dart';

class DashboardTeachingAidContainer extends StatefulWidget {
  final int index;
  const DashboardTeachingAidContainer({required this.index, Key? key})
      : super(key: key);

  @override
  State<DashboardTeachingAidContainer> createState() =>
      _DashboardTeachingAidContainerState();
}

class _DashboardTeachingAidContainerState
    extends State<DashboardTeachingAidContainer> {
  var onTap = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          onTap = true;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 60),
        decoration: BoxDecoration(
            color: DashboardScreen.primaryColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
