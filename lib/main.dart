import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_02/core/constants/color_constants.dart';
import 'package:project_02/core/helpers/local_storage.dart';
import 'package:project_02/representation/screens/splash_screen.dart';
import 'package:project_02/routes.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travo app',
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
        // backgroundColor: ColorPalette.backgroundScaffoldColor,
      ),
      routes: routes,
      onGenerateRoute: generateRoutes,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(), 
    );
  }
}
