import 'package:flutter/material.dart';

class TrainingScreenTopbar extends StatefulWidget {
  final double deviceHeight;

  const TrainingScreenTopbar(this.deviceHeight, {Key? key}) : super(key: key);

  @override
  _TrainingScreenTopbarState createState() => _TrainingScreenTopbarState();
}

class _TrainingScreenTopbarState extends State<TrainingScreenTopbar> {
  var _showSearchBar = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: _showSearchBar
          ? widget.deviceHeight * 0.2
          : widget.deviceHeight * 0.11,
      width: double.infinity,
      child: ListView(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Hello Leroy',
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.8),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Find your course',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1),
                  )
                ],
              ),
              const Spacer(),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.yellow.withOpacity(0.6),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 8)),
                    BoxShadow(
                        color: Colors.yellow.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 25,
                        offset: const Offset(0, 15)),
                  ],
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [
                    Colors.yellow.withOpacity(0.3),
                    Colors.yellow.withOpacity(0.5),
                    Colors.yellow.withOpacity(0.7),
                    Colors.yellow.withOpacity(0.9),
                    Colors.yellow
                  ], focal: Alignment.center),
                ),
                alignment: Alignment.center,
                child: IconButton(
                  icon: Icon(
                    _showSearchBar ? Icons.arrow_drop_up_rounded : Icons.search,
                    color: Colors.white,
                    size: _showSearchBar ? 35 : 35,
                  ),
                  onPressed: () {
                    setState(() {
                      _showSearchBar = !_showSearchBar;
                    });
                  },
                ),
              )
            ],
          ),
          if (_showSearchBar)
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: const Text(
                      'Search',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
