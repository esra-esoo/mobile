import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:huayati/app/app.locator.dart';
import 'package:huayati/enums/dialog_type.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.alert: (context, sheetRequest, completer) =>
        _AlertDialog(request: sheetRequest, completer: completer),
    DialogType.confirm: (context, sheetRequest, completer) =>
        _ConfirmDialog(request: sheetRequest, completer: completer),
    DialogType.phoneOrEmail: (context, sheetRequest, completer) =>
        _PhoneOrEmailDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class _AlertDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _AlertDialog({Key key, this.request, this.completer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
      material: (_, __) => MaterialAlertDialogData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      title: Text(
        request.title,
        textAlign: TextAlign.center,
      ),
      content: Container(
        padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
        child: Text(
          request.description,
          textAlign: TextAlign.center,
          softWrap: true,
          overflow: TextOverflow.clip,
        ),
      ),
      actions: <Widget>[
        PlatformDialogAction(
          onPressed: () => completer(DialogResponse(confirmed: true)),
          child: Text(request.mainButtonTitle),
        ),
      ],
    );
  }
}

class _ConfirmDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _ConfirmDialog({Key key, this.request, this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
      material: (_, __) => MaterialAlertDialogData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      title: Text(
        request.title,
        textAlign: TextAlign.center,
      ),
      content: Container(
        padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
        child: Text(
          request.description,
          textAlign: TextAlign.center,
          softWrap: true,
          overflow: TextOverflow.clip,
        ),
      ),
      actions: <Widget>[
        PlatformDialogAction(
          child: Text('تراجع'),
          onPressed: () => completer(DialogResponse(confirmed: false)),
        ),
        PlatformDialogAction(
          cupertino: (_, __) =>
              CupertinoDialogActionData(isDefaultAction: true),
          onPressed: () => completer(DialogResponse(confirmed: true)),
          child: Text('نعم'),
        ),
      ],
    );
  }
}

class _PhoneOrEmailDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _PhoneOrEmailDialog({Key key, this.request, this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isEmail = request.customData as bool;
    var inputValue;
    return PlatformAlertDialog(
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
            autocorrect: false,
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
          onPressed: () => completer(
              DialogResponse(confirmed: true, responseData: inputValue)),
          child: Text(
            'تأكيد',
          ),
        ),
        PlatformDialogAction(
          onPressed: () => completer(DialogResponse(confirmed: false)),
          child: Text('تراجع'),
        ),
      ],
    );
  }
}
