import 'package:flutter/material.dart';
import 'package:project_02/core/constants/dismension_constants.dart';
import 'package:project_02/core/helpers/asset_helper.dart';
import 'package:project_02/representation/screens/select_date_screen.dart';
import 'package:project_02/representation/widgets/app_bar_containner.dart';
import 'package:project_02/representation/widgets/button_widget.dart';
import 'package:project_02/representation/widgets/item_booking_widget.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key});

  static const String routeName = '/hotel_booking_screen';

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Hotel Booking',
      implementLeading: true,
      child: SingleChildScrollView(
        child: Column (
          children: [
            const SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemBookingWidget(
              icon: AssetHelper.icoDestination, 
              title: 'Destination', 
              description: 'South Korea',
              onTap: () {}
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            ItemBookingWidget(
              icon: AssetHelper.icoDate, 
              title: 'Select Date', 
              description: '13 Feb - 18 Feb 2021',
              onTap: () {
                Navigator.of(context).pushNamed(SelectDateScreen.routeName);
              }
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            ItemBookingWidget(
              icon: AssetHelper.icoGuestAndRoom, 
              title: 'Guest and Room', 
              description: '2 Guest, 1 Room',
              onTap: () {}
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            ButtonWidget(
              title: 'Search',
              ontap: () {},
            ),
          ]
        )
      ),
    );
  }
}