import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/widget/appbar_trailing_icon.dart';
import '/screen/app_drawer.dart';
import '/widget/dashboard_topbar.dart';
import '/widget/dashboard_middlebar.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  static const primaryColor = Color(0xff00FF7F);

  final myAppbar = AppBar(
    leading: Builder(builder: (context) {
      return InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: SizedBox(
            height: 30,
            width: 50,
            child: Image.asset(
              'images/dashboard_icon.png',
              fit: BoxFit.fill,
            ),
          ));
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
