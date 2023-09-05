import 'dart:async';
import 'package:project_02/fire_base/fire_base_auth.dart';
import 'package:project_02/validators/validation.dart';

class AuthBloc {
  final _fireAuth = FireAuth();

  final StreamController _nameController =  StreamController();
  final StreamController _emailController =  StreamController();
  final StreamController _passController =  StreamController();
  final StreamController _phoneController =  StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;
  Stream get phoneStream => _phoneController.stream;

  bool isValidInfo(String name, String email, String pass, String phone) {
    if(!Validation.isValidName(name)) {
      _nameController.sink.addError('Vui lòng nhập tên');
      return false;
    }
    _nameController.sink.add('OK');

    if(!Validation.isValidEmail(email)) {
      _emailController.sink.addError('Tài khoản không hợp lệ');
      return false;
    }
    _emailController.sink.add('OK');

    if(!Validation.isValidPhone(phone)) {
      _phoneController.sink.addError('Số điện thoại không hợp lệ');
      return false;
    }
    _phoneController.sink.add('OK');

    if(!Validation.isValidPass(pass)) {
      _passController.sink.addError('Mật khẩu phải chứa trên 6 kí tự');
      return false;
    }
    _passController.sink.add('OK');


    return true;
  }

  void signUp( String name, String email, String phone, String pass, 
    Function onSuccess, Function(String) onError) {
      _fireAuth.signUp(name, email, phone, pass, onSuccess, onError);
  }

  void signIn(String email, String pass, 
    Function onSuccess, Function(String) onSignInError) {
      _fireAuth.signIn(email, pass, onSuccess, onSignInError);
  }

  void dispose() {
    _nameController.close();
    _emailController.close();
    _phoneController.close();
    _passController.close();
  }
}