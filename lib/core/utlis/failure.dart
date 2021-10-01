import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum Error { popup, dialog, snackbar }

class Failure implements Exception {
  final Error? errorType;
  final String errorMessage;

  Failure({this.errorType, required this.errorMessage});

  static handleError(BuildContext context, Failure failure) {
    switch (failure.errorType) {
      case Error.snackbar:
        return _showSnackBar(context, failure);

      case Error.dialog:
        return _showErrorDialog(context, failure);

      case Error.popup:
        return _showErrorPopup(context, failure);

      default:
        return _defaultErrorToast(context, failure);
    }
  }

  static _showSnackBar(context, failure) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(failure.errorMessage),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).errorColor,
      ),
    );
  }

  static _showErrorDialog(context, failure) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Something went Wrong!',
      desc: failure.errorMessage,
      btnCancelOnPress: () {},
      btnCancelText: 'Try again!',
      dismissOnBackKeyPress: true,
      showCloseIcon: true,
    )..show();
  }

  static _showErrorPopup(context, failure) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 5),
      builder: (context, controller) {
        return Flash.bar(
          controller: controller,
          barrierBlur: 2.5,
          barrierDismissible: true,
          position: FlashPosition.top,
          backgroundColor: Theme.of(context).errorColor,
          child: FlashBar(
            content: Text(
              failure.errorMessage,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  static _defaultErrorToast(context, failure) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: failure.errorMessage,
    );
  }
}
