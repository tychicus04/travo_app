import 'package:flutter/material.dart';
import 'package:project_02/core/helpers/asset_helper.dart';
import 'package:project_02/representation/widgets/app_bar_containner.dart';
import 'package:project_02/data/models/hotel_model.dart';
import 'package:project_02/representation/widgets/item_hotel_widget.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});

  static const String routeName = '/hotels_screen.dart';

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {

  final List<HotelModel> listHotel = [
    HotelModel(
      hotelImage: AssetHelper.hotel1,
      hotelName: 'Royal Palm Heritage',
      location: 'Purwokerto, Jateng',
      awayKilometer: '364 m',
      star: 4.5,
      numberOfReview: 3241,
      price: 143,
    ),
    HotelModel(
      hotelImage: AssetHelper.hotel2,
      hotelName: 'Grand Luxury\'s',
      location: 'Banyumas, Jateng',
      awayKilometer: '2.3 km',
      star: 4.2,
      numberOfReview: 3241,
      price: 234,
    ),
    HotelModel(
      hotelImage: AssetHelper.hotel3,
      hotelName: 'The Orlando House',
      location: 'Ajibarang, Jateng',
      awayKilometer: '1.1 km',
      star: 3.8,
      numberOfReview: 1234,
      price: 132,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Hotels',
      implementLeading: true,
      implementBar: true,
      child: SingleChildScrollView(
        child: Column(
          children: listHotel.map((e) => ItemHotelWidget(hotelModel: e)).toList(),
        ),
      ),
    );
  }
}