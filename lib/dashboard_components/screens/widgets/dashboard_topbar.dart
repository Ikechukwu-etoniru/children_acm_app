import 'package:flutter/material.dart';

import '/dashboard_components/screens/dashboard_screen.dart';

class DashboardTopbar extends StatelessWidget {
  final double barHeight;
  const DashboardTopbar(this.barHeight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barWidth = MediaQuery.of(context).size.width;

    return Container(
      height: barHeight,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: DashboardScreen.primaryColor,
          gradient: RadialGradient(colors: [
            DashboardScreen.primaryColor.withOpacity(0.4),
            DashboardScreen.primaryColor.withOpacity(0.6),
            DashboardScreen.primaryColor.withOpacity(0.8),
            DashboardScreen.primaryColor
          ], center: Alignment.topCenter, radius: 1),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(0, 10),
                blurRadius: 20)
          ]),
      child: Row(children: [
        SizedBox(
          height: barHeight,
          width: barWidth * 0.4,
          child: Image.asset(
            'images/leaf_pic1.png',
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: barHeight * 0.08,
              ),
              Container(
                margin: const EdgeInsets.only(left: 5),
                height: barHeight * 0.37,
                width: barWidth * 0.4,
                child: const Text(
                  'Grow in Christ everyday',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      wordSpacing: 1,
                      color: Colors.white,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: barHeight * 0.15,
              ),
              VerseOfTheDayContainer(
                height: barHeight * 0.21,
                width: barWidth * 0.4,
              ),
              const Spacer()
            ],
          ),
        )
      ]),
    );
  }
}

class VerseOfTheDayContainer extends StatefulWidget {
  final double height;
  final double width;
  const VerseOfTheDayContainer(
      {required this.height, required this.width, Key? key})
      : super(key: key);

  @override
  _VerseOfTheDayContainerState createState() => _VerseOfTheDayContainerState();
}

class _VerseOfTheDayContainerState extends State<VerseOfTheDayContainer> {
  var _onPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _onPressed = true;
        });
        Future.delayed(const Duration(milliseconds: 70), () {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Colors.yellow,
                    elevation: 30,
                    title: const Text(
                      'Bible Verse For Today',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                    content: const Text(
                        'hfhfjfkd dndjkdkf ffhfjff fbfkfjfjfgfg fjhfjf'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text(
                          'Close',
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    ],
                  ));
        }).then((value) {
          setState(() {
            _onPressed = false;
          });
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 60),
        margin: const EdgeInsets.only(left: 4),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: _onPressed ? widget.height + 10 : widget.height,
        width: _onPressed ? widget.width + 10 : widget.width,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Colors.yellow, DashboardScreen.primaryColor]),
            borderRadius: BorderRadius.circular(40),
            boxShadow: _onPressed
                ? [
                    const BoxShadow(
                      color: Colors.yellow,
                      spreadRadius: 20,
                      blurRadius: 30,
                    )
                  ]
                : [
                    BoxShadow(
                      color: Colors.yellow.withOpacity(0.8),
                      spreadRadius: 10,
                      blurRadius: 20,
                    )
                  ]),
        child: FittedBox(
          child: Row(
            children: const [
              Text(
                'Verse for today',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              Icon(Icons.arrow_right_rounded)
            ],
          ),
        ),
      ),
    );
  }
}
