
import 'package:flutter/material.dart';
import 'package:productos_app/providers/providers.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/announcement_service.dart';
import 'package:productos_app/widgets/widgets.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
   
  const HomeScreen({Key? key}) : super(key: key);

  @override
 _HomePageBody createState() => _HomePageBody();
}

class _HomeScreenState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final announcementProvider = Provider.of<AnnouncementService>(context);
    final listAnnouncement = announcementProvider.announcements;

    return Scaffold(
      body: ListAnnouncement(listAnnouncement: listAnnouncement),
      bottomNavigationBar: const CustomNavigation(),
    );
  }
}

class _HomePageBody extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    
    final uiProvider = Provider.of<UiProvider>(context);

    //Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    switch(currentIndex){
      case 0:
        return  _HomeScreenState();
      case 1:
        return const UserScreen();
      case 2:
        return const SettingsScreen();
      default:
        return _HomeScreenState();
    }

  }
}