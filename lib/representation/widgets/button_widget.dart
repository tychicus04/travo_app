import 'package:flutter/material.dart';
import 'package:project_02/core/constants/dismension_constants.dart';
import '../../core/constants/color_constants.dart';
import '../../core/constants/textstyle_constants.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.title, this.ontap, this.color});

  final String title;
  final Function()? ontap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kMediumPadding),
          gradient: Gradients.defaultGradientBackground,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: color == null 
          ? TextStyles.defaultStyle.whiteTextColor.bold
          : TextStyles.defaultStyle.bold.copyWith(
            color: ColorPalette.primaryColor
          )
        )
      ),
    );
  }
}