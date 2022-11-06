import 'package:flutter/material.dart';
import 'package:improvment/pages/home.dart';
import 'package:improvment/pages/splash_screen.dart';

Map<String, Widget Function(BuildContext)> routesBuilder(BuildContext context){
  return {
    '/': (context) => const SplashScreen(),
    '/home': (context) => const HomeScreen(),
  };
}