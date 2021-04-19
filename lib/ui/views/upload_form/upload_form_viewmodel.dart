import 'dart:io';

import 'package:huayati/app/locator.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:stacked/stacked.dart';

class UploadFormViewModel extends BaseViewModel {
  final _snackbarService = locator<SnackbarService>();

  File file1;
  File file2;
}
