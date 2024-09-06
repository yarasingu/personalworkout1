import 'package:flutter/material.dart';
import 'package:personalworkout/components/my_drawer_tile.dart';
import 'package:personalworkout/pages/settings_page.dart';
import 'package:personalworkout/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  final _auth = AuthService();

  MyDrawer({super.key});

  void logout() {
    _auth.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Icon(
                Icons.person,
                size: 72,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(
              height: 10,
            ),
            MyDrawerTile(
              title: "Home",
              icon: Icons.home,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            MyDrawerTile(
              title: "Settings",
              icon: Icons.settings,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ));
              },
            ),
            MyDrawerTile(
              title: "Log Out",
              icon: Icons.logout,
              onTap: logout,
            ),
          ],
        ),
      ),
    );
  }
}
