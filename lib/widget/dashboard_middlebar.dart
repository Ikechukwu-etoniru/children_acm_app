import 'package:flutter/material.dart';

import '/widget/dashboard_bottombar.dart';
import '/widget/news_container.dart';

class DashboardMiddlebar extends StatelessWidget {
  final double barHeight;
  DashboardMiddlebar(this.barHeight, {Key? key}) : super(key: key);

  final List<Object> newsList = [];
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: barHeight,
        width: double.infinity,
        color: Colors.white,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            itemCount: newsList.isEmpty ? 4 : newsList.length,
            itemBuilder: (context, index) => const NewsContainer()),
      ),
      Positioned(bottom: 0, child: DashboardBottombar(barHeight * 0.2))
    ]);
  }
}
