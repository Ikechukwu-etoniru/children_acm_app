import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/widget/appbar_trailing_icon.dart';
import '/screen/app_drawer.dart';
import '/widget/dashboard_topbar.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  final myAppbar = AppBar(
    leading: Builder(builder: (context) {
      return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: FaIcon(
          FontAwesomeIcons.stream,
          color: Colors.black.withOpacity(0.7),
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
        children: [DashboardTopbar(deviceHeight * 0.35)],
      ),
    );
  }
}
