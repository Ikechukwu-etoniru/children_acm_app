import 'package:flutter/material.dart';

import '/dashboard_components/screens/dashboard_screen.dart';
import '/models/story.dart';

class SingleStoryScreen extends StatelessWidget {
  final StoryAid story;
  const SingleStoryScreen(this.story, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeigth = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: DashboardScreen.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(right: 20, bottom: 20),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Colors.white.withOpacity(0.6),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_left,
              size: 40,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: deviceHeigth * 0.05,
            width: double.infinity,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
