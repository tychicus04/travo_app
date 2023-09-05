import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_02/blocs/auth_bloc.dart';
import 'package:project_02/core/constants/color_constants.dart';
import 'package:project_02/core/constants/dismension_constants.dart';
import 'package:project_02/core/helpers/asset_helper.dart';
import 'package:project_02/core/helpers/image_healper.dart';
import 'package:project_02/representation/screens/main_app.dart';
import 'package:project_02/representation/widgets/app_bar_containner.dart';
import 'package:project_02/representation/widgets/button_widget.dart';
import 'package:project_02/representation/widgets/dash_line.dart';
import 'package:project_02/representation/widgets/loading_dialog.dart';
import 'package:project_02/representation/widgets/msg_dialog.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static String routeName = "/signup";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final AuthBloc bloc = AuthBloc();

  // controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // boolean
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

  void onSignupClicked() {
    setState(() {
      if(bloc.isValidInfo(_nameController.text, _emailController.text, _passController.text, _phoneController.text )) {

        LoadingDialog.showLoadingDialog(context, 'Loading...');
        bloc.signUp( _nameController.text, _emailController.text, _phoneController.text , _passController.text, () {
          LoadingDialog.hideLoadingDialog(context);
          Navigator.of(context).pushNamed(MainApp.routeName);
        }, (msg) {
          LoadingDialog.hideLoadingDialog(context);
          MsgDialog.showMsgDialog(context, 'Sign-In', msg);
        });
      }
    });
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      implementLeading: true,
      titleString: 'Sign Up',
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: kMediumPadding * 2,
            ),
            StreamBuilder(
              stream: bloc.nameStream,
              builder: (context, snapshot) {
                return TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    errorText: snapshot.hasError ? snapshot.error.toString() : null
                  ),
                );
              }
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            StreamBuilder(
              stream: bloc.emailStream,
              builder: (context, snapshot) {
                return TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    errorText: snapshot.hasError ? snapshot.error.toString() : null
                  ),
                );
              }
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            StreamBuilder(
              stream: bloc.phoneStream,
              builder: (context, snapshot) {
                return TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    errorText: snapshot.hasError ? snapshot.error.toString() : null
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
                      obscureText: !_showPassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        errorText: snapshot.hasError ? snapshot.error.toString() : null
                      ),
                    );
                  }
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
            const SizedBox(
              height: kMediumPadding,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'By tapping sign up you agree to the ',
                      style: TextStyle(
                        color: ColorPalette.text1Color
                      ),
                    ),
                    TextSpan(
                      text: 'Terms and Condition ',
                      style: const TextStyle(
                        color: ColorPalette.primaryColor
                      ),
                      recognizer: TapGestureRecognizer()
                      // ignore: deprecated_member_use
                      ..onTap = () { 
                        // Navigator.of(context).pushNamed(SignupScreen.routeName);
                      },
                    ),
                    const TextSpan(
                      text: 'and ',
                      style: TextStyle(
                        color: ColorPalette.text1Color
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy ',
                      style: const TextStyle(
                        color: ColorPalette.primaryColor
                      ),
                      recognizer: TapGestureRecognizer()
                      // ignore: deprecated_member_use
                      ..onTap = () { 
                        // Navigator.of(context).pushNamed(SignupScreen.routeName);
                      },
                    ),
                    const TextSpan(
                      text: 'of this app',
                      style: TextStyle(
                        color: ColorPalette.text1Color
                      ),
                    ),

                  ]
                )
              )
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              title: 'Sign up',
                      // button is disabled until something has been entered in both fields.
              ontap: onSignupClicked
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
                    
          ]
        ),
      ),
    );
  }
}