import 'package:flutter/material.dart';

class GlossaryContainer extends StatefulWidget {
  final double height;
  final double width;
  final Color color;
  final String title;
  final int id;
  const GlossaryContainer(
      {required this.height,
      required this.width,
      required this.color,
      required this.title,
      required this.id,
      Key? key})
      : super(key: key);

  @override
  _GlossaryContainerState createState() => _GlossaryContainerState();
}

class _GlossaryContainerState extends State<GlossaryContainer> {
  var _onTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _onTapped = true;
        });
        Future.delayed(const Duration(milliseconds: 60), () {}).then((value) {
          setState(() {
            _onTapped = false;
          });
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        margin: _onTapped
            ? const EdgeInsets.all(20)
            : const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widget.color,
            boxShadow: _onTapped
                ? [
                    BoxShadow(
                        color: widget.color.withOpacity(0.8),
                        spreadRadius: 3,
                        blurRadius: 15),
                    BoxShadow(
                        color: widget.color.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 25)
                  ]
                : [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 3,
                        blurRadius: 15)
                  ]),
        child: Row(
          children: [
            SizedBox(
              width: widget.width * 0.4,
              height: widget.height * 0.8,
              child: FittedBox(
                child: Icon(
                  widget.id == 1
                      ? Icons.music_note
                      : widget.id == 2
                          ? Icons.book_rounded
                          : Icons.ac_unit,
                  color: widget.id == 2
                      ? Colors.redAccent
                      : widget.id == 3
                          ? Colors.pink
                          : Colors.green,
                ),
              ),
            ),
            Expanded(
                child: Center(
              child: Text(
                widget.title,
                style: TextStyle(
                    color: widget.id == 2 || widget.id == 3
                        ? Colors.black
                        : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    fontFamily: 'Quicksand'),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
