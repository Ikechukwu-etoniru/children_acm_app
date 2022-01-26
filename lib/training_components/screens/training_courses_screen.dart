import 'package:acm_diocese_of_calabar/dashboard_components/screens/dashboard_screen.dart';
import 'package:acm_diocese_of_calabar/training_components/screens/widgets/training_blocks.dart';
import 'package:flutter/material.dart';

class TrainingCoursesScreen extends StatelessWidget {
  static const routeName = '/training_course_screen.dart';
  const TrainingCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 30,
            color: DashboardScreen.primaryColor,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return const TrainingBlock();
          }),
    );
  }
}
