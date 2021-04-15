import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:huayati/app/localization.dart';
import 'package:huayati/ui/widgets/cupertino_datetime_picker.dart'
    as CupertinoDatetimePickerExtended;

import 'package:huayati/consts/styles.dart';

class DateTimePickerService {
  Future<DateTime> pickDate({
    DateTime initialDate,
    DateTime minDate,
    DateTime maxDate,
    String title,
  }) async {
    DateTime selectedDate;
    if (Platform.isIOS) {
      var tempDate = initialDate ?? DateTime.now();
      selectedDate = await showCupertinoModalPopup(
        context: Get.overlayContext,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: Text(
            title ?? '',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          message: SizedBox(
            height: MediaQuery.of(context).size.height / 5,
            child: CupertinoDatetimePickerExtended.CupertinoDatePicker(
              initialDateTime: initialDate ?? DateTime.now(),
              minimumDate: minDate ??
                  DateTime.now().subtract(const Duration(days: 3 * 365)),
              minuteInterval: 1,
              maximumDate:
                  maxDate ?? DateTime.now().add(const Duration(days: 3 * 365)),
              mode:
                  CupertinoDatetimePickerExtended.CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime dateTime) {
                tempDate = dateTime;
              },
            ),
          ),
          actions: [
            CupertinoActionSheetAction(
              isDefaultAction: true,
              child: Text(
                AppLocalizations.of(context).translate('confirm'),
              ),
              onPressed: () => Navigator.pop(context, tempDate),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text(
              AppLocalizations.of(context).translate('cancel'),
            ),
            onPressed: () => Navigator.pop(context, null),
          ),
        ),
      );
    } else {
      selectedDate = await showDatePicker(
        context: Get.overlayContext,
        initialDate: initialDate ?? DateTime.now(),
        firstDate:
            minDate ?? DateTime.now().subtract(const Duration(days: 3 * 365)),
        lastDate: maxDate ?? DateTime.now().add(const Duration(days: 3 * 365)),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: kcolorPrimaryBlue,
              accentColor: Colors.white,
              colorScheme: ColorScheme.light(primary: kcolorPrimaryBlue),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child,
          );
        },
      );
    }
    return selectedDate;
  }

  Future<DateTime> pickTime({
    DateTime initialTime,
    bool showSecondsColumn = false,
    String title,
  }) async {
    DateTime selectedTime;
    if (Platform.isIOS) {
      var tempTime = DateTime(1969, 1, 1, initialTime.hour, initialTime.minute);
      selectedTime = await showCupertinoModalPopup(
        context: Get.overlayContext,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: Text(
            title ?? '',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          message: SizedBox(
            height: MediaQuery.of(context).size.height / 5,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: CupertinoDatetimePickerExtended.CupertinoDatePicker(
                use24hFormat: true,
                initialDateTime:
                    DateTime(1969, 1, 1, initialTime.hour, initialTime.minute),
                minuteInterval: 1,
                mode: CupertinoDatetimePickerExtended
                    .CupertinoDatePickerMode.time,
                onDateTimeChanged: (DateTime dateTime) {
                  tempTime =
                      DateTime(1969, 1, 1, dateTime.hour, dateTime.minute);
                },
              ),
            ),
          ),
          actions: [
            CupertinoActionSheetAction(
              isDefaultAction: true,
              child: Text(
                AppLocalizations.of(context).translate('confirm'),
              ),
              onPressed: () => Navigator.pop(context, tempTime),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text(
              AppLocalizations.of(context).translate('cancel'),
            ),
            onPressed: () => Navigator.pop(context, null),
          ),
        ),
      );
    } else {
      TimeOfDay time = await showTimePicker(
        context: Get.overlayContext,
        initialTime: TimeOfDay(
          hour: initialTime.hour,
          minute: initialTime.minute,
        ),
        helpText: title,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: kcolorPrimaryBlue,
              colorScheme: ColorScheme.light(
                primary: kcolorPrimaryBlue,
              ),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child,
          );
        },
      );
      if (time == null) return selectedTime;
      selectedTime = new DateTime(1969, 1, 1, time.hour, time.minute);
    }
    return selectedTime;
  }
}
