import 'package:flutter/material.dart';
import 'package:project_02/representation/screens/guest_and_room_booking_screen.dart';
import 'package:project_02/representation/screens/hotel_booking_screen.dart';
import 'package:project_02/representation/screens/hotel_screen.dart';
import 'package:project_02/representation/screens/hotels_screen.dart';
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
  GuestAndRoomBookingScreen.routeName: (context) => const GuestAndRoomBookingScreen(), 
  HotelsScreen.routeName: (context) => const HotelsScreen(), 
};
// MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
//   switch (settings.name) {
//     case DetailHotelScreen.routeName:
//       final HotelModel hotelModel = (settings.arguments as HotelModel);
//       return MaterialPageRoute<dynamic>(
//         settings: settings,
//         builder: (context) => DetailHotelScreen(
//           hotelModel: hotelModel,
//         ),
//       );
//     case CheckOutScreen.routeName:
//       final RoomModel roomModel = (settings.arguments as RoomModel);
//       return MaterialPageRoute<dynamic>(
//         settings: settings,
//         builder: (context) => CheckOutScreen(
//           roomModel: roomModel,
//         ),
//       );

//     case HotelBookingScreen.routeName:
//       final String? destination = (settings.arguments as String?);
//       return MaterialPageRoute<dynamic>(
//         settings: settings,
//         builder: (context) => HotelBookingScreen(
//           destination: destination,
//         ),
//       );
//     default:
//       return null;
//   }
// }
