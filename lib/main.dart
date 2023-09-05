import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_02/blocs/auth_bloc.dart';
import 'package:project_02/core/constants/color_constants.dart';
import 'package:project_02/core/helpers/local_storage.dart';
import 'package:project_02/representation/screens/splash_screen.dart';
import 'package:project_02/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
  runApp(MyApp(
    AuthBloc(),
    MaterialApp(
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
    ),
  ));
}

class MyApp extends InheritedWidget {
  final AuthBloc bloc;
  final Widget child;
  MyApp(this.bloc, this.child) : super(child: child);

  // This widget is the root of your application.
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static MyApp? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyApp>();
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
