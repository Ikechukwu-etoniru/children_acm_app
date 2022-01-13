import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  Widget _drawerList(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      width: 140 + (title.length * 6),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: const Color(0xff3c7b77),
          onTap: () {},
          child: Row(
            children: [
              FaIcon(
                icon,
                color: Colors.grey.withOpacity(0.8),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 20,
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
                    backgroundColor: const Color(0xff3c7b77).withOpacity(0.3),
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
                    style: TextStyle(fontFamily: 'Quicksand', fontSize: 15),
                  ),
                )
              ]),
            ),
            const SizedBox(height: 15),
            _drawerList(FontAwesomeIcons.thList, 'Dashboard'),
            _drawerList(FontAwesomeIcons.bookReader, 'Training'),
            _drawerList(FontAwesomeIcons.calendarAlt, 'ACM Calendar'),
            _drawerList(FontAwesomeIcons.bible, 'BIBLE'),
            _drawerList(FontAwesomeIcons.buffer, 'ACM Glossary'),
            _drawerList(FontAwesomeIcons.university, 'Teaching Aids'),
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
