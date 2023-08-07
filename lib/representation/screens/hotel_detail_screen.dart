import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_02/core/constants/color_constants.dart';
import 'package:project_02/core/constants/dismension_constants.dart';
import 'package:project_02/core/constants/textstyle_constants.dart';
import 'package:project_02/core/helpers/asset_helper.dart';
import 'package:project_02/core/helpers/image_healper.dart';
import 'package:project_02/data/models/hotel_model.dart';
import 'package:project_02/representation/screens/select_room_screen.dart';
import 'package:project_02/representation/widgets/button_widget.dart';
import 'package:project_02/representation/widgets/dash_line.dart';
import 'package:project_02/representation/widgets/item_ultility_hotel_widget.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({super.key, required this.hotelModel});

  static const String routeName = '/hotel_detail_screen';

  final HotelModel hotelModel;

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageHelper.loadFromAsset(
              AssetHelper.hotelDetail,
              fit: BoxFit.fill
            ),
          ),
          Positioned(
            top: kMediumPadding * 3,
            left: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.all(kItemPadding),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(                        
                      kDefaultPadding
                    )
                  ),
                  color: Colors.white                 
                ),
                child: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: 18,
                ),
              )
            ),
          ),
          Positioned(
            top: kMediumPadding * 3,
            right: kMediumPadding,
            child: GestureDetector(
              onTap: () {
              },
              child: Container(
                padding: const EdgeInsets.all(kItemPadding),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(                        
                      kDefaultPadding
                    )
                  ),
                  color: Colors.white                 
                ),
                child: const Icon(
                  FontAwesomeIcons.solidHeart,
                  size: 18,
                  color: Colors.red,
                ),
              )
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.8,
            minChildSize: 0.3,
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: kMediumPadding
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 2),
                    topRight: Radius.circular(kDefaultPadding * 2),
                  )
                ),
                child: Column (
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: kDefaultPadding),
                      child: Container(
                        height: 5,
                        width: 60,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              kItemPadding
                            )
                          ),
                          color: Colors.black
                        ),
                      )
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.hotelModel.hotelName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              const Spacer(),
                              Text(
                                '\$${widget.hotelModel.price.toString()}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              const Text('/night'),
                            ]
                          ),
                          const SizedBox(
                            height: kDefaultPadding
                          ),
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(
                                AssetHelper.icoLocat
                              ),
                              const SizedBox(
                                width: kMinPadding
                              ),
                              Text(
                                widget.hotelModel.location
                              ),
                            ],
                          ),
                          const DashLineWidget(),
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(AssetHelper.icoStar),
                              const SizedBox(
                                width: kMinPadding,
                              ),
                              Text(
                                widget.hotelModel.star.toString(),
                              ),
                              Text(
                                ' (${widget.hotelModel.numberOfReview} reviews)',
                                style: const TextStyle(
                                  color: ColorPalette.subTitleColor,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'See All',
                                style: TextStyles.defaultStyle.bold.primaryTextColor,   
                              ),
                            ],
                          ),
                          const DashLineWidget(),
                          const Text(
                            'Information',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            )
                          ),
                          const SizedBox(
                            height: kDefaultPadding
                          ),
                          const Text(
                            '''You will find every comfort because many of the services that the hotel offers for travellers and of course the hotel is very comfortable.'''
                          ),
                          ItemUltilityHotelWidget(),
                          const SizedBox(
                            height: kDefaultPadding
                          ),
                          const Text(
                            'Location',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            )
                          ),
                          const SizedBox(
                            height: kDefaultPadding
                          ),
                          const Text(
                            '''Located in the famous neighborhood of Seoul, Grand Luxury’s is set in a building built in the 2010s.'''
                          ),
                          const SizedBox(
                            height: kDefaultPadding
                          ),
                          ImageHelper.loadFromAsset(
                            AssetHelper.map,
                          ),
                          const SizedBox(
                            height: kDefaultPadding * 2
                          ),
                          ButtonWidget(
                            title: 'Select Room',
                            ontap: () {
                              Navigator.of(context).pushNamed(SelectRoomScreen.routeName);
                            }
                          ),
                        ]
                      ),
                    ),
                  ]
                )
              );
            }
          ),
        ],
      )
    );
  }
}