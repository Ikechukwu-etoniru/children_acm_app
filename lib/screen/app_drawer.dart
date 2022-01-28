import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../dashboard_components/screens/dashboard_screen.dart';
import '/widget/drawer_animation_container.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  Widget _lowerDrawerList(String text, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      height: 50,
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey.withOpacity(0.8)),
          const SizedBox(width: 30),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black.withOpacity(0.7),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Drawer(
      elevation: 0,
      child: SizedBox(
        height: deviceHeight,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              height: deviceHeight * 0.30,
              child: Stack(children: [
                Positioned(
                  left: 20,
                  bottom: 75,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor:
                        DashboardScreen.primaryColor.withOpacity(0.3),
                  ),
                ),
                const Positioned(
                  bottom: 40,
                  left: 20,
                  child: Text(
                    'Leroy Etoniru',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
                  ),
                ),
                const Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    'Grade - Level 0',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Quicksand',
                        fontSize: 15,
                        color: DashboardScreen.primaryColor),
                  ),
                )
              ]),
            ),
            const SizedBox(height: 15),
            const DrawerAnimationContainer(
                title: 'Dashboard', icon: FontAwesomeIcons.thList, id: 1),
            const DrawerAnimationContainer(
                title: 'Search', icon: FontAwesomeIcons.search, id: 2),
            const DrawerAnimationContainer(
                title: 'Training', icon: FontAwesomeIcons.bookReader, id: 3),
            const DrawerAnimationContainer(
                title: 'Teaching Aids',
                icon: FontAwesomeIcons.university,
                id: 4),
            const DrawerAnimationContainer(
                title: 'ACM Calendar',
                icon: FontAwesomeIcons.calendarAlt,
                id: 5),
            const DrawerAnimationContainer(
                title: 'ACM Glossary', icon: FontAwesomeIcons.buffer, id: 6),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  _lowerDrawerList('Share', FontAwesomeIcons.rss),
                  _lowerDrawerList('Logout', FontAwesomeIcons.userAltSlash)
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
