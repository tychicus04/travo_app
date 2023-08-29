import 'package:flutter/material.dart';

class CheckProvider extends ChangeNotifier {
      bool _checkbox = false;
      void checkValue() {
        _checkbox = !_checkbox;
      }
    }