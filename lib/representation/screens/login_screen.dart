import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_02/core/constants/color_constants.dart';
import 'package:project_02/core/constants/dismension_constants.dart';
import 'package:project_02/core/helpers/asset_helper.dart';
import 'package:project_02/core/helpers/image_healper.dart';
import 'package:project_02/core/provider/provider.dart';
import 'package:project_02/representation/screens/main_app.dart';
import 'package:project_02/representation/screens/signup_screen.dart';
import 'package:project_02/representation/widgets/app_bar_containner.dart';
import 'package:project_02/representation/widgets/button_widget.dart';
import 'package:project_02/representation/widgets/dash_line.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  
  static String routeName = '/login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // controller
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // variable
  final _usernameErr = 'Tài khoản không hợp lệ';
  final _passwordErr = 'Mật khẩu phải có tối thiểu 6 kí tự';
  var _userInvalid = false;
  var _passwordInvalid = false;

  // boolean
  final bool _checkbox = false;
  bool _showPassword = false;

  // handle
  // void checkValue() {
  //   _checkbox = !_checkbox;
  //
  void onToggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;

    });
  }

  void onLoginClicked() {
    setState(() {
      if(_userController.text.length <6 || _userController.text.contains('@')) {
        _userInvalid = true;
      } else {
        _userInvalid = false;
      }

      if(_passwordController.text.length <6) {
        _passwordInvalid = true;
      } else {
        _passwordInvalid = false;
      }

      if(!_passwordInvalid && !_userInvalid) {
        Navigator.of(context).pushNamed(MainApp.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

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
            controller: _userController,
            decoration: InputDecoration(
              labelText: 'Email',
              errorText: _userInvalid ? _usernameErr : null
            ),
          ),
          const SizedBox(
              height: kMediumPadding,
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              TextField(
                controller: _passwordController,
                obscureText: !_showPassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: _passwordInvalid ? _passwordErr : null
                ),
              ),
              GestureDetector(
                onTap: onToggleShowPassword,
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
              GestureDetector(
                onTap: () {

                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: ColorPalette.primaryColor
                  )
                ),
              )
            ]
          ),
          ButtonWidget(
            title: 'Log In',
            // button is disabled until something has been entered in both fields.
            ontap: onLoginClicked,
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
                  const TextSpan(
                    text: 'Don’t have an account? ',
                    style: TextStyle(
                      color: ColorPalette.text1Color
                    ),
                  ),
                  TextSpan(
                    text: 'Sign up',
                    style: const TextStyle(
                      color: ColorPalette.primaryColor
                    ),
                    recognizer: TapGestureRecognizer()
                    // ignore: deprecated_member_use
                    ..onTap = () { 
                      Navigator.of(context).pushNamed(SignupScreen.routeName);
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