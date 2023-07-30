import 'package:flutter/material.dart';
import 'package:project_02/core/constants/dismension_constants.dart';
import 'package:project_02/core/helpers/asset_helper.dart';
import 'package:project_02/representation/widgets/app_bar_containner.dart';
import 'package:project_02/representation/widgets/button_widget.dart';
import 'package:project_02/representation/widgets/item_add_guest_and_room.dart';

class GuestAndRoomBookingScreen extends StatefulWidget {
  const GuestAndRoomBookingScreen({super.key});

  static  String routeName = '/guest_and_room_booking_screen.dart';

  @override
  State<GuestAndRoomBookingScreen> createState() => _GuestAndRoomBookingScreenState();
}

class _GuestAndRoomBookingScreenState extends State<GuestAndRoomBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Add guest and room',
      implementLeading: true,
      child: Column(
        children: [
          const SizedBox(
            height: kMediumPadding * 1.5,
          ),
          const ItemAddGuestAndRoom(
            title: 'Guest', 
            icon: AssetHelper.icoGuest, 
            initData: 2
          ),
          const ItemAddGuestAndRoom(
            title: 'Room', 
            icon: AssetHelper.icoRoom, 
            initData: 1
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            title: 'Done',
            ontap: () {
              Navigator.of(context).pop();
            },
          ),
        ]
      ),
    );
  }
}