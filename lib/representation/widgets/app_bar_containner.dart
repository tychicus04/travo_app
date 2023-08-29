import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_02/core/constants/dismension_constants.dart';
import 'package:project_02/core/helpers/asset_helper.dart';
import 'package:project_02/core/helpers/image_healper.dart';

import '../../core/constants/color_constants.dart';

class AppBarContainerWidget extends StatelessWidget {
  const AppBarContainerWidget({super.key, required this.child, this.title, this.implementLeading = false, this.titleString, this.implementBar = false });

  final Widget child;
  final Widget? title;
  final String? titleString;
  final bool implementLeading;
  final bool implementBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        
        children: [
          
          SizedBox(
            height: 186,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              backgroundColor: ColorPalette.backgroundScaffoldColor,
              title: title ?? 
                Row(
                  
                  children: [
                    if(implementLeading) 
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                kDefaultPadding
                              ),
                            ),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(kItemPadding),
                          child: const Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.black,
                            size: kDefaultIconSize,
                          ),
                        ),
                      ),
                    Expanded(
                      
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              titleString ?? " ",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              )
                            )
                          ],
                        ),
                      ),
                    ),
                  if(implementBar) 
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              kDefaultPadding
                            ),
                          ),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(kItemPadding),
                        child: const Icon(
                          FontAwesomeIcons.bars,
                          color: Colors.black,
                          size: kDefaultIconSize,
                        ),
                      ),
                  ],
                ),
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: Gradients.defaultGradientBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          35,
                        )
                      )
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: ImageHelper.loadFromAsset(
                      AssetHelper.oval1
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ImageHelper.loadFromAsset(
                      AssetHelper.oval2
                    ),
                  ),
                ]
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 156 ),
            padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
            child: child
          ),
        ]
      )
    );
  }
}