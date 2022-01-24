import 'package:flutter/material.dart';

import '/widget/appbar_trailing_icon.dart';
import '/screen/app_drawer.dart';
import 'widgets/dashboard_bottombar.dart';
import 'widgets/dashboard_topbar.dart';
import 'widgets/dashboard_middlebar.dart';
import '/teaching_aid_components/screen/teaching_aid_screen.dart';

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
          size: 30,
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
      body: ListView(
        children: [
          DashboardTopbar(deviceHeight * 0.27),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            child: Row(
              children: [
                const Text(
                  'Children News',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1),
                ),
                const Spacer(),
                TextButton(onPressed: () {}, child: const Text('See more'))
              ],
            ),
          ),
          DashboardMiddlebar(deviceHeight * 0.4),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            child: Row(
              children: [
                const Text(
                  'Popular Teaching Aid',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(TeachingAidScreen.routeName);
                  },
                  child: const Text('See more'),
                )
              ],
            ),
          ),
          DashboardBottombar(deviceHeight * 0.6),
          const SizedBox(height: 100,)
        ],
      ),
    );
  }
}
