import 'package:flutter/material.dart';

import '/screen/app_drawer.dart';
import '/dashboard_components/screens/dashboard_screen.dart';
import '/widget/appbar_trailing_icon.dart';
import 'widgets/training_blocks.dart';

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
          size: 25,
          color: Colors.black,
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
            height: deviceHeight * 0.30,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 1,
                      spreadRadius: 3)
                ]),
            child: Stack(
              children: [
                Positioned(
                  right: 10,
                  bottom: 40,
                  child: SizedBox(
                    height: 130,
                    width: 130,
                    child: Image.asset(
                      'images/training_icon.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Positioned(
                  left: 15,
                  bottom: 40,
                  child: SizedBox(
                    width: 220,
                    child: Text(
                      '"In learning you will teach and in teaching you will learn"',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.brown,
                          fontFamily: 'Quicksand'),
                    ),
                  ),
                ),
                const Positioned(
                  left: 15,
                  top: 15,
                  child: SizedBox(
                    width: 240,
                    child: Text(
                      'Train, Learn, Update, Equip yourself for the ministry',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 23,
                          color: DashboardScreen.primaryColor),
                    ),
                  ),
                ),
              ],
            ),
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
