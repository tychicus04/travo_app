import 'package:flutter/material.dart';
import 'package:project_02/core/constants/dismension_constants.dart';
import 'package:project_02/core/helpers/asset_helper.dart';
import 'package:project_02/representation/screens/guest_and_room_booking_screen.dart';
import 'package:project_02/representation/screens/hotels_screen.dart';
import 'package:project_02/representation/screens/select_date_screen.dart';
import 'package:project_02/representation/widgets/app_bar_containner.dart';
import 'package:project_02/representation/widgets/button_widget.dart';
import 'package:project_02/representation/widgets/item_booking_widget.dart';
import 'package:project_02/core/extensions/date_ext.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key, required this.destination});

  static const String routeName = '/hotel_booking_screen';

  final String? destination;

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {

  String? dateSelected;
  String? guestAndRoomSelected;

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
              description: widget.destination ?? 'Destination',
              onTap: () {}
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            ItemBookingWidget(
              icon: AssetHelper.icoDate, 
              title: 'Select Date', 
              description: dateSelected ?? '13 Feb - 18 Feb 2021',
              onTap: () async {
                final result = await Navigator.of(context).pushNamed(SelectDateScreen.routeName);
                if(!(result as List<DateTime?>).any((element) => element == null)) {
                  dateSelected = '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                  setState(() {});
                }
              }
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            ItemBookingWidget(
              icon: AssetHelper.icoGuestAndRoom, 
              title: 'Guest and Room', 
              description: '2 Guest, 1 Room',
              onTap: () async {
                final result = await Navigator.of(context).pushNamed(GuestAndRoomBookingScreen.routeName);
                if(!(result as List<int?>).any((element) => element == null)) {
                  // guestAndRoomSelected = '${result[0]?.} - ${result[1]?}';
                  setState(() {});
                }
              }
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            ButtonWidget(
              title: 'Search',
              ontap: () {
                Navigator.of(context).pushNamed(HotelsScreen.routeName);
              },
            ),
          ]
        )
      ),
    );
  }
}