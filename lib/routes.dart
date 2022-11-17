import 'package:flutter/material.dart';
import 'package:improvment/pages/edit_profile.dart';
import 'package:improvment/pages/home.dart';
import 'package:improvment/pages/auth.dart';
import 'package:improvment/pages/profile.dart';
import 'package:improvment/pages/splash_screen.dart';
import 'package:improvment/pages/tasks.dart';

Map<String, Widget Function(BuildContext)> routesBuilder(BuildContext context){
  return {
    '/': (context) => const SplashScreen(),
    '/home': (context) => const HomeScreen(),
    '/profile': (context) => const ProfileScreen(),
    '/fitness': (context) => const FitnessTaskScreen(),
    '/medication': (context) => const MedicationTaskScreen(),
    '/recreation': (context) => const RecreationTaskScreen(),
    '/socialize': (context) => const SocializeTaskScreen(),
    '/editProfile': (context) => const EditScreen(),
    '/login': (context) => const AuthScreen(),
  };
}