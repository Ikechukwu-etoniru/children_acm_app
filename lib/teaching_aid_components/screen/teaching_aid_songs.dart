import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/dashboard_components/screens/dashboard_screen.dart';
import '/teaching_aid_components/screen/widgets/category_animation.dart';
import '/provider/songs_provider.dart';

class TeachingAidSongScreen extends StatelessWidget {
  static const routeName = '/teaching_aid_song_screen';
  const TeachingAidSongScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Categories',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              letterSpacing: 1),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 30,
            color: DashboardScreen.primaryColor,
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: DashboardScreen.categoryList.length,
        itemBuilder: (context, index) => CategoryAnimationContainer(
          color: const Color(0xff312c76),
          height: deviceHeight * 0.2,
          category: DashboardScreen.categoryList[index],
          taType: 'Songs',
          amount: Provider.of<SongProvider>(context)
              .numberPerCategory(DashboardScreen.categoryList[index]),
        ),
      ),
    );
  }
}
