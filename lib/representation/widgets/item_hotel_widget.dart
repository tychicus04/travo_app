import 'package:flutter/material.dart';
import 'package:project_02/core/constants/color_constants.dart';
import 'package:project_02/core/constants/dismension_constants.dart';
import 'package:project_02/core/helpers/asset_helper.dart';
import 'package:project_02/core/helpers/image_healper.dart';
import 'package:project_02/data/models/hotel_model.dart';
import 'package:project_02/representation/screens/hotel_detail_screen.dart';
import 'package:project_02/representation/widgets/button_widget.dart';
import 'package:project_02/representation/widgets/dash_line.dart';

class ItemHotelWidget extends StatelessWidget {
  const ItemHotelWidget({super.key, required this.hotelModel});

  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(right: kDefaultPadding),
            child: ImageHelper.loadFromAsset(
              hotelModel.hotelImage,
              radius: const BorderRadius.only(
                topLeft: Radius.circular(
                  kDefaultPadding
                ),
                bottomRight: Radius.circular(
                  kDefaultPadding
                ),
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.all(
              kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelModel.hotelName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.icoLocat),
                    const SizedBox(
                      width: kMinPadding,
                    ),
                    Text(
                      hotelModel.location,
                    ),
                    Text(
                      '- ${hotelModel.awayKilometer} from destination',
                      style: const TextStyle(
                        color: ColorPalette.subTitleColor,
                      ),
                      maxLines: 2,
                    )
                  ]
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.icoStar),
                    const SizedBox(
                      width: kMinPadding,
                    ),
                    Text(
                      hotelModel.star.toString(),
                    ),
                    Text(
                      ' (${hotelModel.numberOfReview} reviews)',
                      style: const TextStyle(
                        color: ColorPalette.subTitleColor,
                      ),
                    )
                  ]
                ),
                const DashLineWidget(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${hotelModel.price.toString()}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24
                            ),
                          ),
                          const SizedBox(
                            height: kMinPadding,
                          ),
                          const Text(
                            '/night',
                            style: TextStyle(
                              color: ColorPalette.subTitleColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        title: 'Book a room',
                        ontap: () {
                          Navigator.of(context).pushNamed(HotelDetailScreen.routeName, arguments: hotelModel);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}