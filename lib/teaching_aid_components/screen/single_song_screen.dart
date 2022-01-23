import 'package:flutter/material.dart';

import '/dashboard_components/screens/dashboard_screen.dart';
import '/models/song.dart';

class SingleSongScreen extends StatelessWidget {
  final SongAid song;
  const SingleSongScreen(this.song, {Key? key}) : super(key: key);

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
              child: Stack(
                children: [
                  ListView(),
                  Positioned(
                    bottom: 20,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 90,
                      width: deviceWidth * 0.9,
                      decoration: BoxDecoration(
                        color: DashboardScreen.primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 45,
                            left: 20,
                            child: Container(
                              width: 200,
                              margin: const EdgeInsets.all(5),
                              child: FittedBox(
                                child: Text(
                                  song.title,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 14,
                              left: 20,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                height: 25,
                                width: song.category.toString().substring(11).length * 12,
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding:  const EdgeInsets.symmetric(vertical: 2),
                                child: FittedBox(
                                  child: Text(
                                    song.category.toString().substring(11),
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    right: 60,
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                            color: DashboardScreen.primaryColor,
                            shape: BoxShape.circle),
                        child: IconButton(
                          icon: const Icon(
                            Icons.pause,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () {},
                        ),
                      ),
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
