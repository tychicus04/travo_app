import 'package:flutter/material.dart';
import 'package:project_02/core/constants/dismension_constants.dart';
import 'package:project_02/core/helpers/asset_helper.dart';
import 'package:project_02/core/helpers/image_healper.dart';

class ItemUltilityHotelWidget extends StatelessWidget {
  ItemUltilityHotelWidget({super.key});

  final List<Map<String, String>> listUtility = [
    {
      'icon': AssetHelper.icoWifi,
      'name': 'Free\nWifi',
    },
    {
      'icon': AssetHelper.icoNonRefundable,
      'name': 'Non-\nRefundable',
    },
    {
      'icon': AssetHelper.icoBreakFast,
      'name': 'Free\nBreakfast',
    },
    {
      'icon': AssetHelper.icoNonSmoking,
      'name': 'Non-\nSmoking',
    },
  ];

  Widget _buildItemUtilityHotel({required String icon, required String name}) {
    return Column(
      children: [
        ImageHelper.loadFromAsset(
          icon
        ),
        const SizedBox(
          height: kTopPadding,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kDefaultPadding
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: 
          listUtility
            .map(
              (e) => _buildItemUtilityHotel(
                icon: e['icon']!, 
                name: e['name']!,
                ),
              )
              .toList()
      ),
    );
  }
}

