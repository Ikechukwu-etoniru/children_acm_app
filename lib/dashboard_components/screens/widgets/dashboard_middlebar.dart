import 'package:flutter/material.dart';

import 'news_container.dart';

class DashboardMiddlebar extends StatelessWidget {
  final double barHeight;
  DashboardMiddlebar(this.barHeight, {Key? key}) : super(key: key);

  final List<Object> newsList = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: barHeight,
      width: double.infinity,
      color: Colors.transparent,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          itemCount: newsList.isEmpty ? 4 : newsList.length,
          itemBuilder: (context, index) => const NewsContainer()),
    );
  }
}
