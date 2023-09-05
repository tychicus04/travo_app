// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {

  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;
  
  void signUp(String name, String email,String phone, String pass,
    Function onSuccess, Function (String) onRegisterError) async {
      try {
        UserCredential result = await _fireBaseAuth
            .createUserWithEmailAndPassword(email: email, password: pass);
        User? user = result.user;
        _createUser(user!.uid, name, phone, onSuccess, onRegisterError);
      } catch (err) {
        // ignore: prefer_interpolation_to_compose_strings
        print("err: " + err.toString());
        _onSignupErr(err.toString(), onRegisterError);
      }
  }

  void signIn(String email, String pass, Function onSuccess,
      Function(String) onSignInError) {
    _fireBaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      onSuccess();
    }).catchError((err) {
      // ignore: prefer_interpolation_to_compose_strings
      print("err: " + err.toString());
      onSignInError("Sign-In fail, please try again");
    });
  }

  _createUser(String userID, String name, String phone, 
    Function onSuccess, Function (String) onRegisterError) {
    // ignore: prefer_collection_literals
    var user = Map<String, String>();
    user["name"] = name;
    user["phone"] = phone;
    // ignore: deprecated_member_use
    var ref = FirebaseDatabase.instance.reference().child('users');
    ref.child(userID).set(user).then((user) {

      onSuccess();
    }).catchError((err) {
      onRegisterError('Signup fail, please try again!');
    });
  }

  void _onSignupErr(String code, Function (String) onRegisterError) {
    print(code);
    switch (code) {
      case  "ERROR_INVALID_EMAIL":
      case "ERROR_INVALID_CREDETIAL":
        onRegisterError('Invalid email');
        break;
      case "ERROR_EMAIL_ALREADY_EXIST":
        onRegisterError('Email already exists');
        break;
      case "ERROR_WEAK_PASSWORD":
        onRegisterError('The password is not strong enough!');
        break;
      default:
        onRegisterError('Signup fail, please try again!');
        break;
    }
  }
}
