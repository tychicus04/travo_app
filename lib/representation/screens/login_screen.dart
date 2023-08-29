

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_02/core/constants/color_constants.dart';
import 'package:project_02/core/constants/dismension_constants.dart';
import 'package:project_02/core/helpers/asset_helper.dart';
import 'package:project_02/core/helpers/image_healper.dart';
import 'package:project_02/core/provider/provider.dart';
import 'package:project_02/representation/widgets/app_bar_containner.dart';
import 'package:email_validator/email_validator.dart';
import 'package:project_02/representation/widgets/button_widget.dart';
import 'package:project_02/representation/widgets/dash_line.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  
  static String routeName = '/login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
    

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    bool _checkbox = false;
      void checkValue() {
        _checkbox = !_checkbox;
      }

    return AppBarContainerWidget(
      implementLeading: true,
      titleString: 'Login  ',
      // title: const Padding(
      //   padding: EdgeInsets.symmetric(
      //     horizontal: kMediumPadding,
      //   ),
      //   child: Row(
      //     children: [
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             'Login', 
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               fontSize: 20,
      //             ),
      //           ),
      //           SizedBox(
      //             height: kMediumPadding,
      //           ),
      //           Text(
                  
      //             'Hi, Welcome back!', 
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               fontSize: 12,
      //             ),
      //           ),
      //         ]
      //       ),
      //     ]
      //   ),
      // ),
      child: Column(
        children: [
          const SizedBox(
              height: kMediumPadding * 2,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            onChanged: (value) {
              setState(() {
                var _email = value;
                var _emailOk = EmailValidator.validate(_email);
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(
              ),
              labelText: 'Email',
            ),
          ),
          const SizedBox(
              height: kMediumPadding,
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  ),
                  label: Text('Password'),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, kItemPadding, kItemPadding),
                  child: ImageHelper.loadFromAsset(
                    AssetHelper.icoHidePassWord,
                    width: 24,
                    height: 24
                  )
                )
              )
            ]

          ),
          Row(
            children: [
              Checkbox(
                value: _checkbox, 
                onChanged: (value) =>
                      context.read<CheckProvider>().checkValue(),
              ),
              const SizedBox(
                width: kMinPadding,
              ),
              const Text(
                'Remember me'
              ),
              const Spacer(),
              const Text(
                'Forgot password?'
              )
            ]
          ),
          ButtonWidget(
            title: 'Log In',
            // button is disabled until something has been entered in both fields.
            ontap: () {}
            // (_passwordOk && _emailOk) ? ()=> _logInPressed() : null,
          ),
          const DashLineWidget(),
          const Text(
            'or log in with'
          ),
          const SizedBox(
              height: kMediumPadding,
          ),
          Row(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(kMediumPadding),
                          // gradient: Gradients.defaultGradientBackground,
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageHelper.loadFromAsset(
                              AssetHelper.icoGoogle
                            ),
                            const SizedBox(
                              width: kMinPadding,
                            ),
                            const Text(
                              'Google',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16
                              )
                            )
                          ]
                        )
                      ),
                    ),
                  ]
                ),
              ),
              const SizedBox(
                width: kMediumPadding,
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(kMediumPadding),
                          // gradient: Gradients.defaultGradientBackground,
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageHelper.loadFromAsset(
                              AssetHelper.icoFacebook
                            ),
                            const SizedBox(
                              width: kMinPadding,
                            ),
                            const Text(
                              'Facebook',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16
                              )
                            )
                          ]
                        )
                      ),
                    ),

                  ]
                )
              )
            ],
          ),
          const SizedBox(
            height: kMediumPadding
          ),
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Don’t have an account?',
                    style: TextStyle(
                      color: ColorPalette.text1Color
                    ),
                  ),
                  TextSpan(
                    text: 'Sign up',
                    style: TextStyle(
                      color: ColorPalette.primaryColor
                    ),
                    recognizer: TapGestureRecognizer()
                    // ignore: deprecated_member_use
                    ..onTap = () { 
                      Navigator.of(context).pop();
                    },
                  )

                ]
              )
            )
          )
        ]
      )
    );
  }
}