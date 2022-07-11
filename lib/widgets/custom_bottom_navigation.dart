import 'package:flutter/material.dart';
import 'package:productos_app/providers/cambio_screen.dart';
import 'package:provider/provider.dart';

class CustomNavigation extends StatelessWidget {

  final currentIndex = 0;

  const CustomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    // ignore: avoid_unnecessary_containers
    return Container(
      child: BottomNavigationBar(
        
        onTap: (int i) => uiProvider.selectedMenuOpt = i ,
        currentIndex: currentIndex,
        selectedItemColor: Theme.of(context).hintColor,
        showUnselectedLabels: false,
        backgroundColor: Colors.blue[800],
        unselectedItemColor: Colors.black,
        
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_size_select_actual_rounded),
            label: 'Posteos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Usuarios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_sharp),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }

}