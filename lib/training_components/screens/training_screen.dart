import 'package:flutter/material.dart';

import '/screen/app_drawer.dart';
import '/training_components/screens/widgets/training_screen_middlebar.dart';
import '/training_components/screens/widgets/training_screen_topbar.dart';
import '/training_components/screens/widgets/training_screen_bottombar.dart';

class TrainingScreen extends StatelessWidget {
  static const routeName = 'training_screen.dart';
  TrainingScreen({Key? key}) : super(key: key);

  final myAppbar = AppBar(
      leading: Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.menu_open_rounded,
            size: 30,
            color: Colors.black,
          ),
        );
      }),
      backgroundColor: Colors.transparent,
      elevation: 0);

  final List<Color> blockColorsList = [
    const Color(0xfffff0f0),
    const Color(0xfff3eded),
    const Color(0xfff5f3ef),
    const Color(0xffe1e3ff),
  ];

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height -
        myAppbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: myAppbar,
      body: ListView(
        shrinkWrap: true,
        children: [
          TrainingScreenTopbar(deviceHeight),
          TrainingScreenMiddlebar(deviceHeight),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: deviceHeight * 0.1,
            child: Row(children: [
                const Text(
                  'Courses',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See all',
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ]),
          ),
          TrainingScreenBottombar()
        ],
      ),
    );
  }
}
