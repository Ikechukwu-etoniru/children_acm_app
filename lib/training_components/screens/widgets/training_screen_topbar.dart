import 'package:flutter/material.dart';

class TrainingScreenTopbar extends StatefulWidget {
  final double deviceHeight;

  const TrainingScreenTopbar(this.deviceHeight, {Key? key}) : super(key: key);

  @override
  _TrainingScreenTopbarState createState() => _TrainingScreenTopbarState();
}

class _TrainingScreenTopbarState extends State<TrainingScreenTopbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: widget.deviceHeight * 0.11,
      width: double.infinity,
      child: Row(
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
                    fontSize: 27,
                    fontWeight: FontWeight.w900,
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
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
