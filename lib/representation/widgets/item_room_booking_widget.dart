import 'package:flutter/material.dart';
import 'package:project_02/core/constants/dismension_constants.dart';
import 'package:project_02/core/constants/textstyle_constants.dart';

import 'package:project_02/core/helpers/image_healper.dart';
import 'package:project_02/data/models/room_model.dart';
import 'package:project_02/representation/widgets/button_widget.dart';
import 'package:project_02/representation/widgets/dash_line.dart';
import 'package:project_02/representation/widgets/item_ultility_hotel_widget.dart';

class ItemRoomBookingWidget extends StatelessWidget {
  const ItemRoomBookingWidget({super.key, required this.roomModel, this.onTap, this.numberOfRoom});

  final RoomModel roomModel;
  final Function()? onTap;
  final int? numberOfRoom;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        kDefaultPadding,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(kItemPadding)),
        color: Colors.white
      ),
      margin: const EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roomModel.roomName,
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      'Room Size: ${roomModel.size} m2',
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      roomModel.utility
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: ImageHelper.loadFromAsset(
                  roomModel.roomImage,
                  radius: const BorderRadius.all(
                    Radius.circular(kItemPadding)
                  ),
                )
              )
            ]
          ),
          ItemUltilityHotelWidget(),
          const DashLineWidget(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${roomModel.price.toString()}',
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    const SizedBox(
                      height: kMinPadding,
                    ),
                    Text(
                      '/night',
                      style: TextStyles.defaultStyle.fontCaption,
                    ),
                  ]
                ),
              ),
              Expanded(
                child: numberOfRoom == null
                    ? ButtonWidget(
                        title: 'Choose',
                        ontap: onTap,
                      )
                    : Text(
                        '$numberOfRoom room',
                        textAlign: TextAlign.end,
                      ),
              ),
            ],
          ),
        ],
      )
    );
  }
}