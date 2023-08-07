import 'package:flutter/material.dart';
import 'package:project_02/core/helpers/asset_helper.dart';
import 'package:project_02/data/models/room_model.dart';
import 'package:project_02/representation/screens/checkout_screen.dart';
import 'package:project_02/representation/widgets/app_bar_containner.dart';
import 'package:project_02/representation/widgets/item_room_booking_widget.dart';

class SelectRoomScreen extends StatefulWidget {
  const SelectRoomScreen({super.key});

  static const String routeName = '/selectRoomScreen';

  @override
  State<SelectRoomScreen> createState() => _SelectRoomScreenState();

}

class _SelectRoomScreenState extends State<SelectRoomScreen> {
  final List<RoomModel> listRoom = [
    RoomModel(
      roomImage: AssetHelper.room1,
      roomName: 'Deluxe Room',
      size: 27,
      utility: 'Free Cancellation',
      price: 245,
    ),
    RoomModel(
      roomImage: AssetHelper.room2,
      roomName: 'Executive Suite',
      size: 32,
      utility: 'Non-refundable',
      price: 289,
    ),
    RoomModel(
      roomImage: AssetHelper.room3,
      roomName: 'King Bed Only Room',
      size: 24,
      utility: 'Non-refundable',
      price: 214,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Select Room',
      implementLeading: true,
      child: SingleChildScrollView(
        child: Column(
          children: listRoom
            .map(
              (e) => ItemRoomBookingWidget(
              roomModel: e,
              onTap: () {
                Navigator.of(context).pushNamed(CheckoutScreen.routeName);
              },
              )
            )
            .toList()
        )
      )
    );
  }
}