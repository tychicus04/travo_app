import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {

  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;
  
  void signUp(String name, String email,String phone, String pass,Function onSuccess) async {
    try {
      UserCredential result = await _fireBaseAuth
          .createUserWithEmailAndPassword(email: email, password: pass);
      User? user = result.user;
      _createUser(user!.uid, name, phone, onSuccess);
    } catch (e) {
      // 
    }
  }

  _createUser(String userID, String name, String phone, Function onSuccess) {
    var user = {'name' : name, 'phone' : phone};
    // ignore: deprecated_member_use
    var ref = FirebaseDatabase.instance.reference().child('users');
    ref.child(userID).set(user).then((user) {

      onSuccess();
    }).catchError((err) {

    });
  }
}
