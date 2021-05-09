import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';

/// A DialogService that uses the Get package to show dialogs
class DialogService {
  Completer<DialogResponse> _dialogCompleter;

  Future<DialogResponse> showAlertDialog({
    String title,
    String description,
    String closeTitle,
  }) {
    _dialogCompleter = Completer<DialogResponse>();
    showPlatformDialog(
      context: Get.overlayContext,
      androidBarrierDismissible: false,
      builder: (_) => PlatformAlertDialog(
        material: (_, __) => MaterialAlertDialogData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        content: Container(
          padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
          child: Text(
            description,
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.clip,
          ),
        ),
        actions: <Widget>[
          PlatformDialogAction(
            onPressed: () {
              if (!_dialogCompleter.isCompleted)
                completeDialog(DialogResponse(confirmed: true));
            },
            child: Text(closeTitle ?? 'تراجع'),
          ),
        ],
      ),
    );

    return _dialogCompleter.future;
  }

  Future<DialogResponse> showConfirmDialog({
    String title,
    String description,
    String confirmationTitle,
    String cancelTitle,
  }) {
    _dialogCompleter = Completer<DialogResponse>();
    showPlatformDialog(
      context: Get.overlayContext,
      androidBarrierDismissible: false,
      builder: (_) => PlatformAlertDialog(
        material: (_, __) => MaterialAlertDialogData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        content: Container(
          padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
          child: Text(
            description,
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.clip,
          ),
        ),
        actions: <Widget>[
          PlatformDialogAction(
            onPressed: () {
              if (!_dialogCompleter.isCompleted)
                completeDialog(DialogResponse(confirmed: false));
            },
            child: Text(cancelTitle ?? 'تراجع'),
          ),
          PlatformDialogAction(
            cupertino: (_, __) =>
                CupertinoDialogActionData(isDefaultAction: true),
            onPressed: () {
              if (!_dialogCompleter.isCompleted)
                completeDialog(DialogResponse(confirmed: true));
            },
            child: Text(
              confirmationTitle ?? 'نعم',
            ),
          ),
        ],
      ),
    );
    return _dialogCompleter.future;
  }

  Future<DialogResponse> showPhoneOrEmailDialog({
    @required bool isEmail,
  }) {
    _dialogCompleter = Completer<DialogResponse>();
    var inputValue = '';
    showPlatformDialog(
      context: Get.overlayContext,
      androidBarrierDismissible: false,
      builder: (_) => PlatformAlertDialog(
        material: (_, __) => MaterialAlertDialogData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        title: Text(
          isEmail ? 'أدخل عنوان البريد الالكتروني' : 'أدخل رقم الهاتف',
          textAlign: TextAlign.center,
        ),
        content: Material(
          type: MaterialType.transparency,
          child: Container(
            padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
            child: PlatformTextField(
              keyboardType:
                  isEmail ? TextInputType.emailAddress : TextInputType.number,
              maxLength: isEmail ? null : 10,
              autofocus: true,
              inputFormatters: isEmail
                  ? []
                  : [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly
                    ],
              cupertino: (_, __) => CupertinoTextFieldData(
                placeholder: isEmail ? 'email@mail.com' : '09XXXXXXXX',
              ),
              material: (_, __) => MaterialTextFieldData(
                decoration: InputDecoration(
                    hintText: isEmail ? 'email@mail.com' : '09XXXXXXXX'),
              ),
              onChanged: (value) => inputValue = value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        actions: <Widget>[
          PlatformDialogAction(
            cupertino: (_, __) => CupertinoDialogActionData(
              isDefaultAction: true,
            ),
            onPressed: () {
              if (!_dialogCompleter.isCompleted)
                completeDialog(
                  DialogResponse(
                    confirmed: true,
                    responseData: [inputValue],
                  ),
                );
            },
            child: Text(
              'تأكيد',
            ),
          ),
          PlatformDialogAction(
            onPressed: () {
              if (!_dialogCompleter.isCompleted)
                completeDialog(
                  DialogResponse(
                    confirmed: false,
                    responseData: [inputValue],
                  ),
                );
            },
            child: Text('تراجع'),
          ),
        ],
      ),
    );

    return _dialogCompleter.future;
  }

  /// Completes the dialog and passes the [response] to the caller
  void completeDialog(DialogResponse response) {
    Get.back();
    _dialogCompleter.complete(response);
    _dialogCompleter = null;
  }
}

/// The response returned from awaiting a call on the [DialogService]
class DialogResponse {
  /// Indicates if a showConfirmationDialog has been confirmed or rejected.
  /// null will be returned when it's not a confirmation dialog.
  final bool confirmed;

  /// A place to put any response data from dialogs that may contain text fields
  /// or multi selection options
  final List<String> responseData;

  DialogResponse({
    this.confirmed,
    this.responseData,
  });
}
