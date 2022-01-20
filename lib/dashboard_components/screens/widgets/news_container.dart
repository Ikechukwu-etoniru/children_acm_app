import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      height: 250,
      width: 170,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 20,
                
                offset: const Offset(0, 10))
          ]),
      child: Stack(
        children: [
          Container(
            height: 250,
            width: 170,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Image.asset(
                'images/happy_girl.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                color: Colors.grey.withOpacity(0.3),
              ),
              height: 70,
              width: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Title of Article',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                  Text(
                    'Date',
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        fontFamily: 'Quicksand',
                        fontSize: 17),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
