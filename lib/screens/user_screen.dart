import 'package:flutter/material.dart';

import 'package:productos_app/share_preferences/preferences.dart';
import 'package:productos_app/widgets/widgets.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('DarkMode: ${Preferences.isDarkmode}'),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigation(),
    );
  }
}
