import 'package:flutter/material.dart';
import 'package:improvment/pages/splash_screen.dart';
import 'package:improvment/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Improvement',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routesBuilder(context),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
