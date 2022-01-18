import 'package:flutter/material.dart';

import '/dashboard_components/screens/widgets/dashboard_teaching_aid_container.dart';

class DashboardBottombar extends StatelessWidget {
  final double barHeight;
  const DashboardBottombar(this.barHeight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: barHeight,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2/2.3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (context, index) => const DashboardTeachingAidContainer(),
      ),
    );
  }
}
