import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_02/core/constants/dismension_constants.dart';
import 'package:project_02/core/constants/textstyle_constants.dart';
import 'package:project_02/core/helpers/asset_helper.dart';
import 'package:project_02/core/helpers/image_healper.dart';
import 'package:project_02/representation/screens/main_app.dart';
import 'package:project_02/representation/widgets/button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static String routeName= '/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}


class _IntroScreenState extends State<IntroScreen> {
  final PageController  _pageController = PageController();

  final StreamController<int> _pageStreamController = StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  // ignore: unused_element
  Widget _buildItemIntroScreen(String image, String title, String description, AlignmentGeometry alignment) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: alignment,
          child: ImageHelper.loadFromAsset(
            image,
            height: 435,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(
          height: kMediumPadding* 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kMediumPadding
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              Text(
                title, 
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              )
            ]
          )
        ) 
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildItemIntroScreen(
                AssetHelper.intro1, 
                'Book a flight', 
                'Found a flight that matches your destination and schedule? Book it instantly.',
                Alignment.centerRight,
              ),
              _buildItemIntroScreen(
                AssetHelper.intro2, 
                'Find a hotel room', 
                'Select the day, book your room. We give you the best price.',
                Alignment.center,
              ),
              _buildItemIntroScreen(
                AssetHelper.intro3, 
                'Enjoy your trip', 
                'Easy discovering new places and share these between your friends and travel together.',
                Alignment.centerLeft,
              ),
            ],
          ),
          Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 4,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: SmoothPageIndicator(  
                    controller: _pageController,  // PageController  
                    count:  3,  
                    effect:  const ExpandingDotsEffect(
                      dotWidth: kMinPadding,
                      dotHeight: kMinPadding,
                      activeDotColor: Colors.orange,
                    ),  // your preferred effect   
                  ),
                ),
                StreamBuilder<int>(
                  initialData: 0,
                  stream: _pageStreamController.stream,
                  builder: (context, snapshot) {
                    return Expanded(
                      flex: 4,
                      child:  ButtonWidget(
                        title: snapshot.data != 2 ? 'Next' : 'Get Started',
                        ontap:() {
                          if(_pageController.page != 2) {
                            _pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
                          } else {
                            Navigator.of(context).pushNamed(MainApp.routeName);
                          }
                        }
                      ),
                    );
                  }
                )
              ],
            )
          )
        ],
      ),
    );
  }
}