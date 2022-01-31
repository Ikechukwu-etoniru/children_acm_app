import 'package:acm_diocese_of_calabar/dashboard_components/screens/dashboard_screen.dart';
import 'package:acm_diocese_of_calabar/provider/songs_provider.dart';
import 'package:acm_diocese_of_calabar/teaching_aid_components/screen/single_song_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteListScreen extends StatelessWidget {
  static const routeName = '/favourite_list_screen.dart';
  const FavouriteListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceM = MediaQuery.of(context).size;
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final String title = arguments['2'];
    final List<dynamic> aidSongList = Provider.of<SongProvider>(context).songAidFavList;
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: title == 'Songs'
            ? ListView.builder(
                itemCount: aidSongList.length,
                itemBuilder: (ctx, index) => SingleFavContainer(
                    height: deviceM.height * 0.1,
                    teachingAid: aidSongList[index],
                    width: deviceM.width * 0.9,
                    id: title),
              )
            : Center(
                child: Text('think harder'),
              ));
  }
}

class SingleFavContainer extends StatelessWidget {
  final double height;
  final dynamic teachingAid;
  final double width;
  final String id;
  const SingleFavContainer(
      {required this.height,
      required this.teachingAid,
      required this.width,
      required this.id,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      height: height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 5),
            )
          ]),
      child: Row(
        children: [
          SizedBox(
            width: width * 0.04,
          ),
          SizedBox(
            width: width * 0.2,
            child: Stack(children: [
              Center(
                child: id == 'Songs'
                    ? const Icon(Icons.my_library_music,
                        color: DashboardScreen.primaryColor, size: 60)
                    : const Icon(Icons.ac_unit),
              ),
              const Positioned(
                top: 22,
                left: 5,
                child: CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.yellow,
                ),
              ),
              const Positioned(
                top: 8,
                left: 13,
                child: CircleAvatar(
                  radius: 1.5,
                  backgroundColor: Colors.yellow,
                ),
              ),
              Positioned(
                top: 5,
                left: width * 0.1,
                child: const CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.yellow,
                ),
              ),
            ]),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: height * 0.9,
            width: width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    teachingAid.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Quicksand',
                        fontSize: 18),
                  ),
                ),
                const SizedBox(height: 3),
                FittedBox(
                  child: Text(
                    id == 'Songs'
                        ? teachingAid.songLyrics.substring(0, 15)
                        : 'okay',
                    style: const TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                if (id == 'Songs') {
                  Navigator.of(context).pushNamed(SingleSongScreen.routeName,
                      arguments: {'1': teachingAid});
                }
              },
              child: const Icon(
                Icons.forward,
                color: Colors.yellow,
                size: 40,
              ),
            ),
          ),
          const SizedBox(width: 15)
        ],
      ),
    );
  }
}
