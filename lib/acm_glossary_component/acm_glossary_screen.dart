import 'package:acm_diocese_of_calabar/acm_glossary_component/widgets/animated_glossary_container.dart';
import 'package:flutter/material.dart';

import '/screen/app_drawer.dart';
import '/widget/appbar_trailing_icon.dart';

class AcmGlossaryScreen extends StatelessWidget {
  static const routeName = 'acm_glossary_screen.dart';
  AcmGlossaryScreen({Key? key}) : super(key: key);

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
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _myAppbar,
      drawer: const AppDrawer(),
      body: ListView(
        children: [
          GlossaryContainer(
            height: deviceSize.height * 0.18,
            width: deviceSize.width * 0.9,
            color: const Color(0xff312c76),
            title: 'ACM ANTHEM',
            id: 1,
          ),
          GlossaryContainer(
            height: deviceSize.height * 0.18,
            width: deviceSize.width * 0.9,
            color: const Color(0xfffce9e1),
            title: 'ACM Pledge',
            id: 2,
          ),
          GlossaryContainer(
            height: deviceSize.height * 0.18,
            width: deviceSize.width * 0.9,
            color: const Color(0xfffce9e1),
            title: 'ACM Hierachy',
            id: 3,
          )
        ],
      ),
    );
  }
}
