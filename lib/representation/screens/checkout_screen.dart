import 'package:flutter/material.dart';
import 'package:project_02/core/constants/color_constants.dart';
import 'package:project_02/core/constants/dismension_constants.dart';
import 'package:project_02/core/constants/textstyle_constants.dart';
import 'package:project_02/core/helpers/asset_helper.dart';
import 'package:project_02/core/helpers/image_healper.dart';
import 'package:project_02/core/helpers/size_config.dart';
import 'package:project_02/data/models/room_model.dart';
import 'package:project_02/representation/screens/main_app.dart';
import 'package:project_02/representation/widgets/app_bar_containner.dart';
import 'package:project_02/representation/widgets/button_widget.dart';
import 'package:project_02/representation/widgets/item_room_booking_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.roomModel});

  static const String routeName = '/checkout_screen';

  final RoomModel roomModel;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  List<String> listStep = [
    'Book and Review',
    'Payment',
    'Confirm'
  ];

  Widget _buildItemOptionCheckOut(String icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper.loadFromAsset(
                icon,
              ),
              const SizedBox(
                width: kDefaultPadding,
              ),
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
            ]
          ),
          const SizedBox(
            height: kMediumPadding,
          ),
          Container(
            
            // width: SizeConfig.screenWidth * 0.5,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: ColorPalette.primaryColor.withOpacity(0.15)
            ),
            padding: const EdgeInsets.all(kMinPadding),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kMediumPadding),
                    color: Colors.white
                  ),
                  alignment: Alignment.center,
                  child: ImageHelper.loadFromAsset(
                    AssetHelper.icoAdd,
                    width: kMediumPadding, height: kMediumPadding
                  ),
                ),
                const SizedBox(
                  width: kDefaultPadding
                ),
                Text(
                  value,
                  style: TextStyles.defaultStyle.primaryTextColor.bold,
                ),
              ],
            )
          ),
        ]
      ),    
    );
  }

  Widget _buildItemStepCheckOut(int step, String stepName, bool isEnd, bool isCheck) {
      return Row(
        children: [
          Container(
            width: kMediumPadding,
            height: kMediumPadding,
            decoration: BoxDecoration(
              color: isCheck ? Colors.white : Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(
                kMediumPadding
              )
            ),
            alignment: Alignment.center,
            child: Text(
              step.toString(),
              style: TextStyle(
                color: isCheck ? Colors.black : Colors.white
              )
            )
          ),
          const SizedBox(
            width: kMinPadding,
          ),
          Text(
            stepName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12
            ),
          ),
          const SizedBox(
            width: kMinPadding,
          ),
          if(!isEnd) 
            const SizedBox(
              width: kDefaultPadding,
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.white
              )
            ),
          if(!isEnd) 
            const SizedBox(
              width: kMinPadding
            )
        ]
      );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Checkout',
      implementLeading: true,
      child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: listStep
                .map(
                  (e) => _buildItemStepCheckOut(
                    listStep.indexOf(e) + 1,
                    e,
                    listStep.indexOf(e) == listStep.length - 1,
                    listStep.indexOf(e) == 0
                  )
                )
                .toList()
            ),
            const SizedBox(
              height: kMinPadding,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ItemRoomBookingWidget(
                      roomModel: widget.roomModel, 
                      numberOfRoom: 1,
                    ),
                    _buildItemOptionCheckOut(
                      AssetHelper.icoContact, 
                      'Contact Details', 
                      'Add Contact'
                    ),
                    const SizedBox(
                      height: kMediumPadding,
                    ),
                    _buildItemOptionCheckOut(
                      AssetHelper.icoPromo, 
                      'Promo Code', 
                      'Add Promo Code'
                    ),
                    const SizedBox(
                      height: kMediumPadding,
                    ),
                    ButtonWidget(
                      title: 'Payment',
                      ontap: () {
                        Navigator.of(context).popUntil((route) => route.settings.name == MainApp.routeName);
                      }
                    ),
                    const SizedBox(
                      height: kMediumPadding,
                    ),
                  ],
                )
              )
            ),
          ],
        )
      );
  }
}