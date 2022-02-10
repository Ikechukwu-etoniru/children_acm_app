import 'package:acm_diocese_of_calabar/acm_glossary_component/widgets/hireachy_container.dart';
import 'package:flutter/material.dart';

import '/dashboard_components/screens/dashboard_screen.dart';
import '../models/glossary_data.dart';

// Glossary screen for the diffrent categories.

class GlossaryDetailScreen extends StatelessWidget {
  final int
      id; // Using this id to determine the data to be shown on each screen
  const GlossaryDetailScreen({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contHeight = (MediaQuery.of(context).size.height) * 0.23;
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
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              id == 1
                  ? 'ACM Anthem'
                  : id == 2
                      ? 'ACM Pledge'
                      : id == 3
                          ? 'ACM Hireachy'
                          : '',
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (id == 1 || id == 2)
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 7),
                child: ListView(
                  children: [
                    if (id == 1)
                      const Text(
                        GlossaryData.acmAnthem,
                        style: TextStyle(fontSize: 18),
                      ),
                    if (id == 2)
                      const Text(
                        GlossaryData.acmPledge,
                        style: TextStyle(fontSize: 18),
                      ),
                  ],
                ),
              ),
            ),
          if (id == 3)
            Expanded(
                child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 7),
              child: ListView(
                children:  [
                  HireachyContainer(
                    height: contHeight )
                ],
              ),
            ))
        ],
      ),
    );
  }
}
