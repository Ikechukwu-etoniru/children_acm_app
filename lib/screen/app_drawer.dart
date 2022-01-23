import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../dashboard_components/screens/dashboard_screen.dart';
import '../teaching_aid_components/screen/teaching_aid_screen.dart';
import '../training components/screens/training_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  Widget _drawerList(
      IconData icon, String title, BuildContext context, int id) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      width: 120 + (title.length * 6),
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: DashboardScreen.primaryColor,
          onTap: id == 1
              ? () {
                  Navigator.of(context).pushReplacementNamed('/');
                }
              : id == 2
                  ? () {
                      Navigator.of(context)
                          .pushReplacementNamed(TrainingScreen.routeName);
                    }
                  : id == 6
                      ? () {
                          Navigator.of(context).pushReplacementNamed(
                              TeachingAidScreen.routeName);
                        }
                      : () {},
          child: Row(
            children: [
              FaIcon(
                icon,
                color: Colors.grey.withOpacity(0.8),
                size: 17,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              )
            ],
          ),
        ),
      ),
    );
  }

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
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 23),
                  ),
                ),
                const Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    'Grade - Level 0',
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 15,
                        color: DashboardScreen.primaryColor),
                  ),
                )
              ]),
            ),
            const SizedBox(height: 15),
            _drawerList(FontAwesomeIcons.thList, 'Dashboard', context, 1),
            _drawerList(FontAwesomeIcons.bookReader, 'Training', context, 2),
            _drawerList(
                FontAwesomeIcons.calendarAlt, 'ACM Calendar', context, 3),
            _drawerList(FontAwesomeIcons.bible, 'BIBLE', context, 4),
            _drawerList(FontAwesomeIcons.buffer, 'ACM Glossary', context, 5),
            _drawerList(
                FontAwesomeIcons.university, 'Teaching Aids', context, 6),
            _drawerList(FontAwesomeIcons.search, 'Search', context, 7),
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
