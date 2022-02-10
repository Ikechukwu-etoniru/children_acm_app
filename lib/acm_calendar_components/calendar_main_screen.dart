import 'package:acm_diocese_of_calabar/acm_calendar_components/widgets/calendar_container.dart';
import 'package:flutter/material.dart';

import '/screen/app_drawer.dart';
import '/widget/appbar_trailing_icon.dart';

class CalendarMainScreen extends StatelessWidget {
  static const routeName = 'calendar_main_screen.dart';
  CalendarMainScreen({Key? key}) : super(key: key);

  final _myAppbar = AppBar(
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
    final calendarContainerHeight = (MediaQuery.of(context).size.height) * 0.15;
    final calendarContainerWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _myAppbar,
      drawer: const AppDrawer(),
      body: Column(
        children: [
          const SizedBox(
            child: Text(
              'ACM Activities for 2022',
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: 1),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: ListView(
            children: [
              CalendarContainer(
                height: calendarContainerHeight,
                width: calendarContainerWidth,
              )
            ],
          ))
        ],
      ),
    );
  }
}
