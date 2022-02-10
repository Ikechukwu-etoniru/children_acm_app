import 'package:flutter/material.dart';

class HireachyContainer extends StatelessWidget {
  final double height;
  const HireachyContainer({required this.height, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: height * 0.60,
              child: Text('Link to pic of person'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Name of person'),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Position in ACM',
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
