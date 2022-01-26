import 'package:flutter/material.dart';

class CategoryAnimationContainer extends StatefulWidget {
  final double height;
  final Color color;
  const CategoryAnimationContainer(
      {required this.height, required this.color, Key? key})
      : super(key: key);

  @override
  _CategoryAnimationContainerState createState() =>
      _CategoryAnimationContainerState();
}

class _CategoryAnimationContainerState
    extends State<CategoryAnimationContainer> {
  var _onTappped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _onTappped = true;
        });
        Future.delayed(const Duration(milliseconds: 100), () {}).then((value) {
          setState(() {
            _onTappped = false;
          });
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        margin: _onTappped
            ? const EdgeInsets.symmetric(horizontal: 10, vertical: 3)
            : const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        height: !_onTappped ? widget.height : widget.height + 10,
        decoration: BoxDecoration(
            color: widget.color.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
            boxShadow: _onTappped ? [] : []),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 10,
              child: _onTappped
                  ? const Icon(
                      Icons.lightbulb,
                      color: Colors.yellow,
                    )
                  : const Icon(Icons.lightbulb_outline_rounded,
                      color: Colors.yellow),
            ),
            Positioned(
              child: Container(
                height: widget.height ,
                width: (widget.height * 3) * 0.35,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
