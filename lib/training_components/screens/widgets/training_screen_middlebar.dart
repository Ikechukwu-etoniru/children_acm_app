import 'package:acm_diocese_of_calabar/dashboard_components/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class TrainingScreenMiddlebar extends StatelessWidget {
  final double deviceHeight;
  const TrainingScreenMiddlebar(this.deviceHeight, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      height: deviceHeight * 0.3,
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 10)),
            BoxShadow(
                color: DashboardScreen.primaryColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 25,
                offset: const Offset(0, 20))
          ],
          color: DashboardScreen.primaryColor,
          borderRadius: BorderRadius.circular(30)),
      child: Stack(
        children: [
          Positioned(
            left: 25,
            bottom: 25,
            child: GestureDetector(
              onTap: () {},
              child: const Chip(
                label: Text(
                  'Start Now',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                elevation: 20,
                backgroundColor: Colors.yellow,
                shadowColor: Colors.yellow,
                padding: EdgeInsets.all(11),
              ),
            ),
          ),
          Positioned(
            right: -13,
            bottom: 10,
            child: SizedBox(
              height: 160,
              width: 160,
              child: Image.asset(
                'images/training_pic.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 15,
            left: 5,
            child: SizedBox(
              height: (deviceHeight * 0.3) * 0.5,
              width: 180,
              child: const Center(
                child: Text(
                  '',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
