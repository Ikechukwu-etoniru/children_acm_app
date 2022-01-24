import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '/dashboard_components/screens/dashboard_screen.dart';
import '/models/story.dart';
import '/provider/story_provider.dart';
import '/models/song.dart';
import '/teaching_aid_components/screen/widgets/story_list_container.dart';

//Screen that will contain all stories in our teacher's aid story category

class TeachingAidStory extends StatefulWidget {
  static const routeName = '/story.dart';
  const TeachingAidStory({Key? key}) : super(key: key);

  @override
  State<TeachingAidStory> createState() => _TeachingAidStoryState();
}

class _TeachingAidStoryState extends State<TeachingAidStory> {
  final List<String> _categoryList = [
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

  final List<TaCategory>? _filterCatsList = [];

  var _showCategoryBlock = false;

  final Set _selectedItem = {};

  void _applyFilters(Set selectedItems) {
    for (var element in _selectedItem) {
      if (element == 0) {
        _filterCatsList?.add(TaCategory.general);
      } else if (element == 1) {
        _filterCatsList?.add(TaCategory.faith);
      } else if (element == 2) {
        _filterCatsList?.add(TaCategory.love);
      } else if (element == 3) {
        _filterCatsList?.add(TaCategory.christmas);
      } else if (element == 4) {
        _filterCatsList?.add(TaCategory.easter);
      } else if (element == 5) {
        _filterCatsList?.add(TaCategory.fathers);
      } else if (element == 6) {
        _filterCatsList?.add(TaCategory.mothers);
      } else if (element == 7) {
        _filterCatsList?.add(TaCategory.repentance);
      } else if (element == 8) {
        _filterCatsList?.add(TaCategory.forgiveness);
      }
    }
  }

  void _selectedIndex(int index) {
    setState(() {
      if (_selectedItem.contains(index)) {
        _selectedItem.remove(index);
      } else {
        _selectedItem.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dH = MediaQuery.of(context);
    final deviceHeight = dH.size.height - dH.padding.top;
    final deviceWidth = dH.size.width;
    final List<StoryAid> storyList = _filterCatsList!.isEmpty
        ? Provider.of<StoryProvider>(context).storyList
        : Provider.of<StoryProvider>(context)
            .filterByCategories(_filterCatsList!);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Story List',
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
                    child: const Center(
                      child: FaIcon(FontAwesomeIcons.slidersH,
                          color: DashboardScreen.primaryColor),
                    ),
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
                      itemCount: _categoryList.length,
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
                              color: _selectedItem.contains(index)
                                  ? DashboardScreen.primaryColor
                                  : Colors.white),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                _categoryList[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: _selectedItem.contains(index)
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
                              _selectedItem.clear();
                              _showCategoryBlock = false;

                              _filterCatsList!.clear();
                            });
                          },
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(width: 10),
                        if (_selectedItem.isNotEmpty)
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedItem.clear();
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
                        if (_selectedItem.isNotEmpty)
                          const SizedBox(
                            width: 10,
                          ),
                        Expanded(
                            child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (_selectedItem.isEmpty) {
                                _filterCatsList!.clear();
                              }

                              _applyFilters(_selectedItem);
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
              itemCount: storyList.length,
              itemBuilder: (context, index) =>
                  StoryListContainer(storyList[index]),
            ),
          ),
        ],
      ),
    );
  }
}
