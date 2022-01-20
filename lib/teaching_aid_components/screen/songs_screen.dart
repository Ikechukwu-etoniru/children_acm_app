import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/dashboard_components/screens/dashboard_screen.dart';
import '/models/song.dart';
import '/provider/songs_provider.dart';
import '/teaching_aid_components/screen/widgets/song_list_container.dart';

//Screen that will contain all songs in our teacher's aid song category

class TeachingAidSongs extends StatelessWidget {
  static const routeName = '/songs.dart';
  TeachingAidSongs({Key? key}) : super(key: key);

  final List<String> categoryList = [
    'General',
    'Faith',
    'Love',
    'Christmas',
    'Easter',
    'Fathers',
    'Mothers',
    'Repentance',
    'Forgiveness',
  ];

  List<String> choosenCategoryList = [];

  Future<dynamic> filterSongsDialog(BuildContext ctx) {
    return showDialog(
        context: ctx,
        barrierDismissible: false,
        builder: (ctx) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 30,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  const Center(
                    child: SizedBox(
                      height: 30,
                      child: Text(
                        'List Filter',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 30,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      'Categories',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 17,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      itemCount: categoryList.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 100,
                              childAspectRatio: 3 / 1.3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          border: Border.all(
                              color: DashboardScreen.primaryColor, width: 1),
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              categoryList[index],
                              style: const TextStyle(
                                  color: DashboardScreen.primaryColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: const Text('CLOSE'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                'Apply Filter',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final dH = MediaQuery.of(context);
    final deviceHeight = dH.size.height - dH.padding.top;
    final deviceWidth = dH.size.width;
    final List<SongAid> songList = Provider.of<SongProvider>(context).songList;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Song List',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            color: DashboardScreen.primaryColor.withOpacity(0.1),
          ),
          child: IconButton(
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
        actions: [
          const Icon(
            Icons.search_rounded,
            color: DashboardScreen.primaryColor,
            size: 25,
          ),
          const SizedBox(width: 10),
          IconButton(
              onPressed: () {
                filterSongsDialog(context);
              },
              icon: const Icon(
                Icons.menu,
                color: DashboardScreen.primaryColor,
                size: 25,
              )),
          const SizedBox(width: 10)
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: deviceHeight * 0.7,
            width: deviceWidth,
            child: ListView.builder(
              itemCount: songList.length,
              itemBuilder: (context, index) =>
                  SongListContainer(songList[index]),
            ),
          )
        ],
      ),
    );
  }
}
