import 'dart:async';

import 'package:acm_diocese_of_calabar/provider/songs_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dashboard_screen.dart';

class DashboardTeachingAidContainer extends StatefulWidget {
  final int index;
  const DashboardTeachingAidContainer({required this.index, Key? key})
      : super(key: key);

  @override
  State<DashboardTeachingAidContainer> createState() =>
      _DashboardTeachingAidContainerState();
}

class _DashboardTeachingAidContainerState
    extends State<DashboardTeachingAidContainer> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      print('5seconds');
    });

    // Provider.of<SongProvider>(context).randomSongaid();
  }

  var _onTap = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _onTap = true;
        });

        Future.delayed(const Duration(milliseconds: 70), () {}).then((value) {
          setState(() {
            _onTap = false;
          });
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 60),
        padding: _onTap ? const EdgeInsets.all(15) : const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: DashboardScreen.primaryColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
