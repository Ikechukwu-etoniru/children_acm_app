import 'package:flutter/material.dart';

import '/screen/app_drawer.dart';
import '/widget/appbar_trailing_icon.dart';


class CalendarMainScreen extends StatelessWidget {
  static const routeName = 'calendar_main_screen.dart';
   CalendarMainScreen({ Key? key }) : super(key: key);

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
    return Scaffold(
      appBar: _myAppbar,
      drawer: const AppDrawer(),
      
    );
  }
}