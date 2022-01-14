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
    actions: const [AppbarTrailingIcon()],
  );

  final List<Color> gridColors = [
    Colors.deepPurple,
    Colors.teal,
    Colors.orange,
    Colors.red,
    Colors.purple,
    Colors.brown,
    Colors.yellow,
    Colors.indigo,
    Colors.amber,
    Colors.cyan
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
            height: deviceHeight * 0.12,
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
              child: GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) =>
                      TrainingBlock(gridColors[index])),
            ),
          )
        ],
      ),
    );
  }
}
