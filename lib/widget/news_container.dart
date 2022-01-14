import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({Key? key}) : super(key: key);
//Color(0xff3c7b77)
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.withOpacity(0.03),
      ),
      child: Row(
        children: [
          Center(
            child: Container(
              height: 130,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.3)),
              child: const Center(
                child: Text('Image'),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 5, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Title of Article',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    fontFamily: 'Quicksand',
                  ),
                ),
                const Text('Brief Description'),
                Text(
                  'Date',
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                      fontFamily: 'Quicksand',
                      fontSize: 17),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
