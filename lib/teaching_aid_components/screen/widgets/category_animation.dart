import 'package:flutter/material.dart';

import '../object_lesson_list_screen.dart';
import '/dashboard_components/screens/dashboard_screen.dart';
import '/teaching_aid_components/screen/song_list_screen.dart';
import '/teaching_aid_components/screen/story_list_screen.dart';
import '/teaching_aid_components/screen/artwork_list_screen.dart';

class CategoryAnimationContainer extends StatefulWidget {
  final double height;
  final Color color;
  final String category;
  final String taType;
  final int amount;
  const CategoryAnimationContainer(
      {required this.height,
      required this.color,
      required this.category,
      required this.taType,
      required this.amount,
      Key? key})
      : super(key: key);

  @override
  _CategoryAnimationContainerState createState() =>
      _CategoryAnimationContainerState();
}

class _CategoryAnimationContainerState
    extends State<CategoryAnimationContainer> {
  var _onTappped = false;
  String get imageName {
    if (widget.category == 'All') {
      return 'images/all_pic.png';
    } else if (widget.category == 'General') {
      return 'images/general_pic.png';
    } else if (widget.category == 'Faith') {
      return 'images/faith_pic.png';
    } else if (widget.category == 'Love') {
      return 'images/christmass_pic.png';
    } else if (widget.category == 'Christmas') {
      return 'images/christmass_pic.png';
    } else if (widget.category == 'Easter') {
      return 'images/faith_pic.png';
    } else if (widget.category == 'Father\'s Day') {
      return 'images/fathers_pic.png';
    } else if (widget.category == 'Mother\'s Day') {
      return 'images/mothers_pic.png';
    } else if (widget.category == 'Repentance') {
      return 'images/bible_pic.png';
    } else if (widget.category == 'Forgiveness') {
      return 'images/faith_pic.png';
    } else {
      return 'images/general_pic.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _onTappped = true;
        });
        Future.delayed(const Duration(milliseconds: 100), () {
          if (widget.taType == 'Object Lesson') {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return ObjectLessonListScreen(taCategory: widget.category);
            }));
          }
          if (widget.taType == 'Art Work') {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return ArtworkListScreen(taCategory: widget.category);
            }));
          }
          if (widget.taType == 'Story') {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return StoryListScreen(taCategory: widget.category);
            }));
          }
          if (widget.taType == 'Songs') {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return SongListScreen(taCategory: widget.category);
            }));
          }
        }).then((value) {
          setState(() {
            _onTappped = false;
          });
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        margin: _onTappped
            ? const EdgeInsets.symmetric(horizontal: 10, vertical: 3)
            : const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        height: !_onTappped ? widget.height : widget.height + 10,
        decoration: BoxDecoration(
            color: widget.color == const Color(0xff312c76)
                ? widget.color.withOpacity(0.1)
                : widget.color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: _onTappped
                ? [
                    BoxShadow(
                      color: DashboardScreen.primaryColor.withOpacity(0.4),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(1, 8),
                    ),
                    BoxShadow(
                      color: DashboardScreen.primaryColor.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: const Offset(1, 29),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(1, 8),
                    ),
                  ]),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 10,
              child: _onTappped
                  ? const Icon(
                      Icons.lightbulb,
                      color: Colors.yellow,
                    )
                  : const Icon(Icons.lightbulb_outline_rounded,
                      color: Colors.yellow),
            ),
            Positioned(
              top: 30,
              child: SizedBox(
                height: widget.height * 0.65,
                width: (widget.height * 3) * 0.25,
                child: Image.asset(
                  imageName,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              right: 35,
              top: 25,
              child: SizedBox(
                height: widget.height * 0.6,
                width: (widget.height * 3) * 0.38,
                child: Text(
                  widget.category,
                  style: const TextStyle(
                      color: Colors.brown,
                      fontSize: 23,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Positioned(
              right: 90,
              bottom: 30,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                height: widget.height * 0.20,
                width: (widget.height * 3) * 0.25,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          '${widget.amount} ${widget.taType}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_right_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
