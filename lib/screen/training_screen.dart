import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/screen/app_drawer.dart';
import '/screen/dashboard_screen.dart';
import '/widget/appbar_trailing_icon.dart';
import '/widget/training_widgets.dart/training_blocks.dart';

class TrainingScreen extends StatelessWidget {
  static const routeName = 'training_screen.dart';
  TrainingScreen({Key? key}) : super(key: key);

  final myAppbar = AppBar(
    leading: Builder(builder: (context) {
      return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: FaIcon(
          FontAwesomeIcons.arrowLeft,
          color: Colors.black.withOpacity(0.7),
        ),
      );
    }),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: const [AppbarTrailingIcon(color: Colors.white)],
  );

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
      backgroundColor: DashboardScreen.primaryColor,
      body: Column(
        children: [
          Container(
            height: deviceHeight * 0.15,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: 20, left: 30, right: 20, bottom: 5),
                    child: Row(
                      children: const [
                        Text(
                          'Courses',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) =>
                          TrainingBlock(blockColorsList[index]),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
