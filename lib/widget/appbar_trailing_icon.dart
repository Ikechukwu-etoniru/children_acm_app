import 'package:flutter/material.dart';

class AppbarTrailingIcon extends StatelessWidget {
  const AppbarTrailingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 45,
      margin: const EdgeInsets.only(right: 18, top: 5),
      child: Material(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(40)
        ),
        color: const Color(0xff3c7b77),
        child: InkWell(
          borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(40)
        ),
          splashColor: Colors.lightGreen,
          onTap: () {},
          child: Container(),
        ),
      ),
    );
  }
}
