import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/dashboard_components/screens/dashboard_screen.dart';
import '/models/song.dart';
import '/provider/songs_provider.dart';
import '/teaching_aid_components/screen/widgets/song_list_container.dart';

//Screen that will contain all songs in our teacher's aid song category

class TeachingAidSongs extends StatefulWidget {
  static const routeName = '/songs.dart';
  const TeachingAidSongs({Key? key}) : super(key: key);

  @override
  State<TeachingAidSongs> createState() => _TeachingAidSongsState();
}

class _TeachingAidSongsState extends State<TeachingAidSongs> {
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

  int selectedGrid = -1;

  TaCategory? filterCatList;

  List<TaCategory>? filterCatsList = [];

  var _showCategoryBlock = false;

  Set selectedItem = {};

  void _applyFilters(Set selectedItems) {
    for (var element in selectedItem) {
      if (element == 0) {
        filterCatsList?.add(TaCategory.general);
      } else if (element == 1) {
        filterCatsList?.add(TaCategory.faith);
      } else if (element == 2) {
        filterCatsList?.add(TaCategory.love);
      } else if (element == 3) {
        filterCatsList?.add(TaCategory.christmas);
      } else if (element == 4) {
        filterCatsList?.add(TaCategory.easter);
      } else if (element == 5) {
        filterCatsList?.add(TaCategory.fathers);
      } else if (element == 6) {
        filterCatsList?.add(TaCategory.mothers);
      } else if (element == 7) {
        filterCatsList?.add(TaCategory.repentance);
      } else if (element == 8) {
        filterCatsList?.add(TaCategory.forgiveness);
      }
    }
  }

  void _selectedIndex(int index) {
    setState(() {
      if (selectedItem.contains(index)) {
        selectedItem.remove(index);
      } else {
        selectedItem.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dH = MediaQuery.of(context);
    final deviceHeight = dH.size.height - dH.padding.top;
    final deviceWidth = dH.size.width;
    final List<SongAid> songList = filterCatsList!.isEmpty
        ? Provider.of<SongProvider>(context).songList
        : Provider.of<SongProvider>(context)
            .filterByCategories(filterCatsList!);

    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Column(
        children: [
          SizedBox(
            width: deviceWidth,
            height: deviceHeight * 0.1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 7, left: 15),
                        suffixIcon: const Icon(Icons.search_rounded),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.only(left: 5, right: 20),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: DashboardScreen.primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.menu,
                        color: DashboardScreen.primaryColor),
                  ),
                  onTap: () {
                    setState(() {
                      _showCategoryBlock = !_showCategoryBlock;
                    });
                  },
                ),
              ],
            ),
          ),
          if (_showCategoryBlock)
            SizedBox(
              height: 300,
              width: deviceWidth,
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      itemCount: categoryList.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 150,
                              childAspectRatio: 3 / 0.8,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (ctx, index) => InkWell(
                        onTap: () {
                          _selectedIndex(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                  color: DashboardScreen.primaryColor),
                              color: selectedItem.contains(index)
                                  ? DashboardScreen.primaryColor
                                  : Colors.white),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                categoryList[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: selectedItem.contains(index)
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 10, right: 20, bottom: 5, top: 5),
                    height: 50,
                    width: deviceWidth,
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedItem.clear();
                              _showCategoryBlock = false;
                            });
                          },
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(width: 10),
                        if (selectedItem.isNotEmpty)
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedItem.clear();
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.red),
                              child: const Center(
                                child: Text(
                                  'Clear',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        if (selectedItem.isNotEmpty)
                          const SizedBox(
                            width: 10,
                          ),
                        Expanded(
                            child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _applyFilters(selectedItem);
                              _showCategoryBlock = false;
                            });
                          },
                          child: const Text('Apply Filters'),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: songList.length,
              itemBuilder: (context, index) =>
                  SongListContainer(songList[index]),
            ),
          ),
        ],
      ),
    );
  }
}
