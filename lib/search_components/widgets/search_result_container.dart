import 'package:acm_diocese_of_calabar/search_components/search_result_screen.dart';
import 'package:flutter/material.dart';

class SearchResultContainer extends StatefulWidget {
  final List<dynamic> teachingAid;
  final Color color;
  final String imageName;
  final double height;
  final double width;
  final List<String> type;
  final int id;
  const SearchResultContainer(
      {required this.teachingAid,
      required this.width,
      required this.color,
      required this.imageName,
      required this.height,
      required this.type,
      required this.id,
      Key? key})
      : super(key: key);

  @override
  _SearchResultContainerState createState() => _SearchResultContainerState();
}

class _SearchResultContainerState extends State<SearchResultContainer> {
  var _onTap = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.teachingAid.isEmpty) {
            _onTap = false;
          }
          if (widget.teachingAid.isNotEmpty) {
            _onTap = true;
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) {
                return SearchResultScreen(teachingAid: widget.teachingAid,category: widget.type[1],
              );
              }));
          }
        });
        Future.delayed(const Duration(milliseconds: 50)).then((_) {
          setState(() {
            _onTap = false;
          });
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 70),
        margin: _onTap
            ? const EdgeInsets.only(right: 8, left: 8, top: 3, bottom: 10)
            : const EdgeInsets.only(right: 15, left: 15, top: 3, bottom: 10),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            boxShadow: _onTap
                ? [
                    BoxShadow(
                      color: widget.color.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(5, 5),
                    ),
                    BoxShadow(
                      color: widget.color.withOpacity(0.2),
                      spreadRadius: 10,
                      blurRadius: 30,
                      offset: const Offset(-5, 5),
                    )
                  ]
                : [
                    BoxShadow(
                      color: widget.color.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(5, 5),
                    ),
                    BoxShadow(
                      color: widget.color.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(-5, 5),
                    )
                  ],
            borderRadius: BorderRadius.circular(20),
            color: widget.color),
        child: Row(children: [
          Center(
            child: SizedBox(
              height: widget.height * 0.8,
              width: widget.width * 0.3,
              child: Image.asset(
                widget.imageName,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: widget.height * 0.23,
                  child: Row(
                    children: [
                      const Spacer(),
                      FittedBox(
                        child: Icon(
                          _onTap
                              ? Icons.lightbulb_rounded
                              : Icons.lightbulb_outline_rounded,
                          color: widget.teachingAid.isEmpty
                              ? Colors.red
                              : widget.id == 2 || widget.id == 3
                                  ? Colors.green
                                  : Colors.yellow,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 3, top: 5),
                      child: Text(
                        widget.teachingAid.length == 1 ||
                                widget.teachingAid.isEmpty
                            ? '${widget.teachingAid.length.toString()} ${widget.type[0]}'
                            : '${widget.teachingAid.length.toString()} ${widget.type[1]}',
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: widget.id == 2 || widget.id == 3
                              ? Colors.black
                              : Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ),
                    const Spacer()
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(right: 25, bottom: 15),
                      child: widget.teachingAid.isEmpty
                          ? const Icon(Icons.search_off_outlined,
                              color: Colors.red)
                          : Text(
                              widget.teachingAid.length == 1
                                  ? 'View it'
                                  : 'View them',
                              style: TextStyle(
                                  color: widget.id == 2 || widget.id == 3
                                      ? Colors.green
                                      : Colors.yellow,
                                  fontSize: 15),
                            ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
