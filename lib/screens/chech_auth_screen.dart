import 'package:flutter/material.dart';

import 'package:productos_app/screens/home_screens.dart';
import 'package:productos_app/screens/login_screen.dart';
import 'package:productos_app/services/user_services.dart';
import 'package:provider/provider.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<UserService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: authService.readToken(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();
              if (snapshot.data == '') {
                Future.microtask(() {
                  //Navigator.of(context).pushReplacementNamed('home');
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const LoginScreen(),
                          transitionDuration: const Duration(seconds: 0)
                          //Realizar un fadeInImage para el splash
                          ));
                });
              } else {
                Future.microtask(() {
                  //Navigator.of(context).pushReplacementNamed('home');
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const HomeScreen(),
                          transitionDuration: const Duration(seconds: 0)
                          //Realizar un fadeInImage para el splash
                          ));
                });
              }
              return Container();
            }),
      ),
    );
  }
}
