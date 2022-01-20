import 'package:acm_diocese_of_calabar/widget/image_chip.dart';
import 'package:flutter/material.dart';

import '/dashboard_components/screens/dashboard_screen.dart';
import '/models/song.dart';
import '/widget/category_chip.dart';

class SongListContainer extends StatelessWidget {
  final SongAid song;
  const SongListContainer(this.song, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ]),
      height: 70,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
            child: ImageChip(song.category),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                SizedBox(
                  height: 30,
                  child: Text(
                    song.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                const Spacer(),
                CategoryChip(
                  height: 20,
                  width: song.category.toString().substring(11).length * 10,
                  text: song.category.toString().substring(11).toUpperCase(),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 50,
            child: const Icon(
              Icons.arrow_right_rounded,
              color: DashboardScreen.primaryColor,
              size: 50,
            )
          ),
        ],
      ),
    );
  }
}
