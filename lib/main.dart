import 'package:flutter/material.dart';

import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/screens/splash_scren.dart';
import 'package:productos_app/services/announcement_service.dart';
import 'package:productos_app/services/notifications_service.dart';
import 'package:productos_app/services/user_services.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'providers/providers.dart';
import 'share_preferences/preferences.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init(); 
  
  runApp(
    MultiProvider(
      providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode)),
      ChangeNotifierProvider(create: (_) => UiProvider()),
      ChangeNotifierProvider(create: (_) => UserService()),
      ChangeNotifierProvider(create: (_) => AnnouncementService())
      ],
      child: const MyApp(),
    ) 
  );
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'splash_screen',
      routes: {
        'login': (_) => const LoginScreen(),
        'home' : (_) => const HomeScreen(),
        'settings': (_) => const SettingsScreen(),
        'checking': (_) => const CheckAuthScreen(),
        'show_image': (_) => const ShowImageScreen(),
        'splash_screen': (_) => const SplashScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
