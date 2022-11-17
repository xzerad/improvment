import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:improvment/models/drawer_cubit.dart';
import 'package:improvment/models/profile_picture_cubit.dart';
import 'package:improvment/models/user_data_cubit.dart';
import 'package:improvment/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
          BlocProvider(create: (_)=> DrawerCubit()),
          BlocProvider(create: (_)=> UserDataCubit(_)),
          BlocProvider(
            lazy: true,
            create: (_)=> ProfilePictureCubit(username: BlocProvider.of<UserDataCubit>(_).state.username),
          )
      ],
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
