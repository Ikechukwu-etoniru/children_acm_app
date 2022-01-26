import 'package:acm_diocese_of_calabar/training_components/screens/widgets/training_blocks.dart';
import 'package:flutter/material.dart';

class TrainingScreenBottombar extends StatelessWidget {
  final double deviceHeight;
  TrainingScreenBottombar(this.deviceHeight, {Key? key}) : super(key: key);

  final List trainingModules = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: deviceHeight * 0.7,
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
        itemBuilder: (ctx, index) => const TrainingBlock(),
      ),
    );
  }
}
