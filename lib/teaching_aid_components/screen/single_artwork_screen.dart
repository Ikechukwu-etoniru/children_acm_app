import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/provider/artwork_provider.dart';
import '/teaching_aid_components/screen/widgets/fav_artwork_floating_action.dart';
import '/dashboard_components/screens/dashboard_screen.dart';
import '/models/artwork.dart';
import '/favorite_components/favourite_list_screen.dart';

class SingleArtworkScreen extends StatelessWidget {
  static const routeName = '/single_artwork_screen.dart';
  const SingleArtworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final artwork = arguments['1'] as ArtworkAid;
    final id = arguments['2'] as String;
    final artworkProvider = Provider.of<ArtworkProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            if (id.isEmpty) {
              Navigator.of(context).pop();
            } else {
              Navigator.of(context).pushReplacementNamed(
                  FavouriteListScreen.routeName,
                  arguments: {'2': id});
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 25,
            color: DashboardScreen.primaryColor,
          ),
        ),
      ),
      floatingActionButton: FavArtworkFloatingButton(
          providerData: artworkProvider, artwork: artwork),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Text(
              artwork.title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              artwork.description,
              style: const TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
