import 'package:acm_diocese_of_calabar/screen/app_drawer.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search_screen.dart';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var _showSearchBar = false;
  String? searchPhrase;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu_open_rounded,
              size: 30,
              color: Colors.black,
            ),
          );
        }),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              'Get all the resources you need for a bible study with one',
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
            ),
          ),
          if (!_showSearchBar)
            GestureDetector(
              onTap: () {
                setState(() {
                  _showSearchBar = true;
                });
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow),
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.yellow.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(2, 5)),
                      BoxShadow(
                          color: Colors.yellow.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(-2, 5)),
                      BoxShadow(
                          color: Colors.yellow.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 20,
                          offset: const Offset(2, 10)),
                    ]),
                child: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          if (_showSearchBar)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              height: deviceHeight * 0.08,
              width: devicewidth,
              child: Row(children: [
                Expanded(
                  child: Container(
                    height: (deviceHeight * 0.08) * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        searchPhrase = value;
                        FocusScope.of(context).unfocus();
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Keyword (Example \'Faith\')',
                        contentPadding: const EdgeInsets.only(
                            left: 10, bottom: 5, right: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    if (searchPhrase == null) {}
                    if (searchPhrase!.isEmpty) {}
                    if (searchPhrase!.isNotEmpty){
                      var finalPhrase =  searchPhrase!.trim().toLowerCase();
                    }
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.yellow.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(2, 5)),
                          BoxShadow(
                              color: Colors.yellow.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(-2, 5)),
                          BoxShadow(
                              color: Colors.yellow.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 20,
                              offset: const Offset(2, 10)),
                        ]),
                    child: const Center(
                      child: Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                )
              ]),
            ),
          if (_showSearchBar)
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
            ))
        ],
      ),
    );
  }
}
