import 'package:flutter/material.dart';

import '/dashboard_components/screens/dashboard_screen.dart';
import 'widgets/songs_widget.dart';

class TeachingAidSongs extends StatelessWidget {
  static const routeName = '/songs.dart';
  const TeachingAidSongs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dH = MediaQuery.of(context);
    final deviceHeight = dH.size.height - dH.padding.top;
    final deviceWidth = dH.size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple.withOpacity(0.1),
        //  const
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_left,
            size: 40,
            color: DashboardScreen.primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        color: Colors.deepPurple.withOpacity(0.1),
        child: const TeachingAidSongWidget(),
      ),
    );
  }
}
