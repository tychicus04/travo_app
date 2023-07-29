import 'package:flutter/material.dart';
import 'package:project_02/representation/screens/hotel_booking_screen.dart';
import 'package:project_02/representation/screens/hotel_screen.dart';
import 'package:project_02/representation/screens/intro_screen.dart';
import 'package:project_02/representation/screens/select_date_screen.dart';
import 'package:project_02/representation/screens/splash_screen.dart';
import 'package:project_02/representation/screens/main_app.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(), 
  IntroScreen.routeName: (context) => const IntroScreen(), 
  MainApp.routeName: (context) => const MainApp(), 
  HotelScreen.routeName: (context) => const HotelScreen(), 
  HotelBookingScreen.routeName: (context) => const HotelBookingScreen(), 
  SelectDateScreen.routeName: (context) => SelectDateScreen(), 
};