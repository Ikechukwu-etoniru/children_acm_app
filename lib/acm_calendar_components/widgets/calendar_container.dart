import 'package:acm_diocese_of_calabar/dashboard_components/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class CalendarContainer extends StatelessWidget {
  final double height;
  final double width;
  const CalendarContainer({required this.height, required this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 22,
              offset: const Offset(0, 10),
            ),
          ]),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.15,
                  child: const FittedBox(
                    child: Text(
                      'Date Of Event',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.4,
                  child: const FittedBox(
                    child: Text(
                      'Name of the Programme',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.2,
                  child: const FittedBox(
                    child: Text(
                      'Location of programme',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              width: width * 0.25,
              child: CircleAvatar(
                radius: width * 0.06,
                backgroundColor: DashboardScreen.primaryColor,
                child: const FittedBox(
                  child: Icon(Icons.check, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
