import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/dashboard_components/screens/dashboard_screen.dart';
import '/teaching_aid_components/screen/teaching_aid_screen.dart';
import '/training_components/screens/training_screen.dart';

class DrawerAnimationContainer extends StatefulWidget {
  final String title;
  final IconData icon;
  final int id;
  const DrawerAnimationContainer(
      {required this.title, required this.icon, required this.id, Key? key})
      : super(key: key);

  @override
  _DrawerAnimationContainerState createState() =>
      _DrawerAnimationContainerState();
}

class _DrawerAnimationContainerState extends State<DrawerAnimationContainer> {
  var _onTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _onTapped = true;
        });
        Future.delayed(const Duration(milliseconds: 70), () {
          widget.id == 1
              ? Navigator.of(context).pushReplacementNamed('/')
              : widget.id == 3
                  ? Navigator.of(context)
                      .pushReplacementNamed(TrainingScreen.routeName)
                  : widget.id == 4
                      ? Navigator.of(context)
                          .pushReplacementNamed(TeachingAidScreen.routeName)
                      : () {};
        }).then((value) {
          setState(() {
            _onTapped = false;
          });
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        margin: !_onTapped
            ? const EdgeInsets.symmetric(horizontal: 15, vertical: 3)
            : const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        width: !_onTapped
            ? 120 + (widget.title.length * 6)
            : 140 + (widget.title.length * 6),
        height: 45,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
            boxShadow: !_onTapped
                ? []
                : [
                    BoxShadow(
                      color: DashboardScreen.primaryColor.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 7),
                    ),
                    BoxShadow(
                      color: DashboardScreen.primaryColor.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ]),
        child: Row(
          children: [
            FaIcon(
              widget.icon,
              color: !_onTapped
                  ? Colors.grey.withOpacity(0.8)
                  : DashboardScreen.primaryColor,
              size: 17,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              widget.title,
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
    );
  }
}
