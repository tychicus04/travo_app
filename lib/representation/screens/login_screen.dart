import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_02/blocs/auth_bloc.dart';
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

  final AuthBloc bloc =  AuthBloc();

  // controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  // boolean
  final bool _checkbox = false;
  bool _showPass = false;

  // handle
  // void checkValue() {
  //   _checkbox = !_checkbox;
  //
  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;

    });
  }

  void onLoginClicked() {
    // setState(() {
    //   if(bloc.isValidInfo(_userController.text, _passController.text)) {
    //     Navigator.of(context).pushNamed(MainApp.routeName);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      implementLeading: true,
      titleString: 'Login',
      child: Column(
        children: [
          const SizedBox(
              height: kMediumPadding * 2,
          ),
          StreamBuilder(
            stream: bloc.emailStream,
            builder: (context, snapshot) {
              return TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: snapshot.hasError ? snapshot.error.toString() : null,
                ),
              );
            }
          ),
          const SizedBox(
              height: kMediumPadding,
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              StreamBuilder(
                stream: bloc.passStream,
                builder: (context, snapshot) {
                  return TextField(
                    controller: _passController,
                    obscureText: !_showPass,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText: snapshot.hasError ? snapshot.error.toString() : null,
                    ),
                  );
                }
              ),
              GestureDetector(
                onTap: onToggleShowPass,
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