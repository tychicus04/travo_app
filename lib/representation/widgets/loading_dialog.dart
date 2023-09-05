import 'package:flutter/material.dart';
import 'package:project_02/core/constants/dismension_constants.dart';

class LoadingDialog {
  static void showLoadingDialog(BuildContext context, String msg) {
    showDialog(
      context: context,  
      barrierDismissible: false, 
      builder: (context) => Dialog(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, kItemPadding, 0, 0),
                child: Text(
                  msg,
                  style: const TextStyle(
                    fontSize: 18
                  )
                )
              )
            ]
          )
        )
      ));
  }

  static void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop(LoadingDialog);
  }
}