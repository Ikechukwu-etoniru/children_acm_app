import 'package:flutter/material.dart';

class AnimationContainer extends StatefulWidget {
  final String? routeName;
  final double? height;
  final double? width;
  final Color? color;
  final String? imageName;
  final String? title;
  final int? id;
  final String? subTitle;
  const AnimationContainer(
      {this.routeName,
      this.height,
      this.width,
      this.color,
      this.imageName,
      this.title,
      this.id,
      this.subTitle,
      Key? key})
      : super(key: key);

  @override
  _AnimationContainerState createState() => _AnimationContainerState();
}

class _AnimationContainerState extends State<AnimationContainer> {
  var _onTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _onTapped = true;
        });
        Future.delayed(const Duration(milliseconds: 100), () {
          Navigator.of(context).pushNamed(widget.routeName!);
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        margin: const EdgeInsets.only(right: 10, left: 10, top: 3, bottom: 10),
        height: !_onTapped ? widget.height : widget.height! + 15,
        width: !_onTapped ? widget.width : widget.width! + 15,
        decoration: BoxDecoration(
            boxShadow: _onTapped
                ? [
                    BoxShadow(
                      color: widget.color!.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(5, 5),
                    ),
                    BoxShadow(
                      color: widget.color!.withOpacity(0.2),
                      spreadRadius: 10,
                      blurRadius: 30,
                      offset: const Offset(-5, 5),
                    )
                  ]
                : [
                    BoxShadow(
                      color: widget.color!.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(5, 5),
                    ),
                    BoxShadow(
                      color: widget.color!.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(-5, 5),
                    )
                  ],
            borderRadius: BorderRadius.circular(30),
            color: widget.color),
        child: Stack(children: [
          Positioned(
            right: 10,
            bottom: 10,
            child: SizedBox(
              height: widget.height! * 0.67,
              width: widget.width! * 0.27,
              child: Image.asset(
                widget.imageName!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              widget.title!,
              style: TextStyle(
                color: widget.id == 2 || widget.id == 3
                    ? Colors.brown
                    : Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 23,
                letterSpacing: 1,
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            child: SizedBox(
              width: widget.width! * 0.65,
              height: widget.height! * 0.58,
              child: Text(
                widget.subTitle!,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  color: widget.id == 2 || widget.id == 3
                      ? Colors.brown
                      : Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
