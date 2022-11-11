import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:improvment/models/drawer_cubit.dart';
import 'package:improvment/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> DrawerCubit(),
      child: MaterialApp(
        title: 'Improvement',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: routesBuilder(context),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.brown,
              statusBarBrightness: Brightness.dark
            )
          )
        ),
      ),
    );
  }
}
