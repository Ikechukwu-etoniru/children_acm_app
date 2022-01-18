import 'package:flutter/material.dart';

import '../dashboard_screen.dart';

class DashboardTeachingAidContainer extends StatelessWidget {
  const DashboardTeachingAidContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DashboardScreen.primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(25)
      ),
    );
  }
}
