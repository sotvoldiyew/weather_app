import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_app/src/feature/home/screen/connection_screen.dart';
import 'package:weather_app/src/feature/home/screen/home_screen.dart';
import 'package:weather_app/src/feature/splash/screen/splash_screnn.dart';

import '../router/app_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
   debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
     AppRouter.home: (context)=> const HomeScreen(),
     AppRouter.splash: (context)=> const SplashScrenn(),
     AppRouter.connection: (context)=> const ConnectionScreen(),
      },
    );
  }
}