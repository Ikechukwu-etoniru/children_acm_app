import 'package:flutter/material.dart';

import '/screen/dashboard_screen.dart';

class AppbarTrailingIcon extends StatelessWidget {
  const AppbarTrailingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 60,
      margin: const EdgeInsets.only(top: 5),
      child: Material(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        color: DashboardScreen.primaryColor,
        child: InkWell(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
          splashColor: Colors.lightGreen,
          onTap: () {},
          child: const Icon(Icons.more_horiz_rounded, color: Colors.white,size: 35,),
        ),
      ),
    );
  }
}
