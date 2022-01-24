import 'package:acm_diocese_of_calabar/training_components/screens/widgets/training_blocks.dart';
import 'package:flutter/material.dart';

class TrainingScreenBottombar extends StatelessWidget {
  TrainingScreenBottombar({Key? key}) : super(key: key);

  final List trainingModules = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
        itemBuilder: (ctx, index) => const TrainingBlock(),
      ),
    );
  }
}
