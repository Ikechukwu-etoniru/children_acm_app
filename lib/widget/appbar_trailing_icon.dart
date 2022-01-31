import 'package:acm_diocese_of_calabar/favorite_components/favourite_screen.dart';
import 'package:flutter/material.dart';

import '../dashboard_components/screens/dashboard_screen.dart';

class AppbarTrailingIcon extends StatelessWidget {
  const AppbarTrailingIcon({
    Key? key,
  }) : super(key: key);

  PopupMenuItem<dynamic> _pOpupMenuList({
    required String text,
    required IconData icon,
    required int value,
  }) {
    return PopupMenuItem(
      value: value,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const Spacer(),
              Icon(icon)
            ],
          ),
          const Divider(
            color: Colors.white,
            thickness: 1,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: const Icon(
          Icons.more_horiz_rounded,
          color: DashboardScreen.primaryColor,
        ),
        color: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 30,
        onSelected: (value) {
          if (value == 1) {
            Navigator.of(context)
                .pushReplacementNamed(FavouriteScreen.routeName);
          }
        },
        itemBuilder: (ctx) {
          return [
            _pOpupMenuList(
                value: 1, text: 'My favourites', icon: Icons.stars_rounded),
            _pOpupMenuList(
                value: 2, text: 'About App', icon: Icons.info_rounded),
            _pOpupMenuList(
                value: 3,
                text: 'Contact Developer',
                icon: Icons.contact_mail_rounded)
          ];
        });
  }
}
