import 'package:flutter/material.dart';
import 'package:project_02/core/constants/dismension_constants.dart';
import 'package:project_02/data/models/room_model.dart';
import 'package:project_02/representation/widgets/app_bar_containner.dart';

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

  Widget _buildItemStepCheckOut(int step, String stepName, bool isEnd, bool isCheck) {
    return Container(
      child: Row(
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
          if(isEnd) 
            const SizedBox(
              width: kMinPadding
            )
        ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Checkout',
      implementLeading: true,
      child: SingleChildScrollView(
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
            )
          ],
        )
      ),
    );
  }
}