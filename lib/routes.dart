import 'package:flutter/material.dart';
import 'package:project_02/data/models/hotel_model.dart';
import 'package:project_02/data/models/room_model.dart';
import 'package:project_02/representation/screens/checkout_screen.dart';
import 'package:project_02/representation/screens/guest_and_room_booking_screen.dart';
import 'package:project_02/representation/screens/hotel_booking_screen.dart';
import 'package:project_02/representation/screens/hotel_detail_screen.dart';
import 'package:project_02/representation/screens/hotel_screen.dart';
import 'package:project_02/representation/screens/hotels_screen.dart';
import 'package:project_02/representation/screens/intro_screen.dart';
import 'package:project_02/representation/screens/select_date_screen.dart';
import 'package:project_02/representation/screens/select_room_screen.dart';
import 'package:project_02/representation/screens/splash_screen.dart';
import 'package:project_02/representation/screens/main_app.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(), 
  IntroScreen.routeName: (context) => const IntroScreen(), 
  MainApp.routeName: (context) => const MainApp(), 
  HotelScreen.routeName: (context) => const HotelScreen(), 
  SelectDateScreen.routeName: (context) => SelectDateScreen(), 
  GuestAndRoomBookingScreen.routeName: (context) => const GuestAndRoomBookingScreen(), 
  HotelsScreen.routeName: (context) => const HotelsScreen(), 
  SelectRoomScreen.routeName: (context) => const SelectRoomScreen(), 
};
// ignore: body_might_complete_normally_nullable
MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HotelDetailScreen.routeName:
      final HotelModel hotelModel = (settings.arguments as HotelModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => HotelDetailScreen(
          hotelModel: hotelModel,
        ),
      );
    case CheckoutScreen.routeName:
      final RoomModel roomModel = (settings.arguments as RoomModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => CheckoutScreen(
          roomModel: roomModel,
        ),
      );
    case HotelBookingScreen.routeName:
      final String? destination = (settings.arguments as String?);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => HotelBookingScreen(
          destination: destination,
        ),
      );
    default:
      return null;
  }
}
