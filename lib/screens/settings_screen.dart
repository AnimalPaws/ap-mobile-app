import 'package:flutter/material.dart';
import 'package:productos_app/providers/providers.dart';
import 'package:productos_app/services/user_services.dart';
import 'package:productos_app/share_preferences/preferences.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'Settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<UserService>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                child: const Image(
                  image: AssetImage('assets/menu-img.jpg'),
                ),
              ),
              SwitchListTile.adaptive(
                  value: Preferences.isDarkmode,
                  title: const Text('DarkMode'),
                  onChanged: (value) {
                    Preferences.isDarkMode = value;
                    final themeProvider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    value
                        ? themeProvider.setDarkmode()
                        : themeProvider.setLigthMode();
                    setState(() {});
                  }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue[800],
            child: Icon(
              Icons.logout,
              color: Theme.of(context).hintColor,
            ),
            onPressed: () {
              authService.logout();
              Navigator.pushReplacementNamed(context, 'login');
            }),
        bottomNavigationBar: const CustomNavigation(),
      ),
    );
  }
}
