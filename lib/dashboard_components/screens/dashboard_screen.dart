import 'package:flutter/material.dart';

import '/widget/appbar_trailing_icon.dart';
import '/screen/app_drawer.dart';
import 'widgets/dashboard_topbar.dart';
import 'widgets/dashboard_middlebar.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  static const primaryColor = Color(0xff00FF7F);

  final myAppbar = AppBar(
    leading: Builder(builder: (context) {
      return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(
          Icons.menu_open_rounded,
          color: Colors.black,
          size: 25,
        ),
      );
    }),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: const [AppbarTrailingIcon()],
  );

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height -
        myAppbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: myAppbar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DashboardTopbar(deviceHeight * 0.35),
          DashboardMiddlebar(deviceHeight * 0.619)
        ],
      ),
    );
  }
}
