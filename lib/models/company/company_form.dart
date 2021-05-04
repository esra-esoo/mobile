import 'dart:io';

import 'package:flutter/material.dart';
import 'package:huayati/enums/group_file_type.dart';

import 'representative_form.dart';

class CompanyForm {
  File commercialLicense;
  File commercialRegister;
  File importersRecord;
  File chamberOfCommerce;
  File groupFile2;
  GroupFileType2 groupFileType2;
  RepresentativeForm representativeForm;

  CompanyForm.initial()
      : commercialLicense = null,
        commercialRegister = null,
        importersRecord = null,
        chamberOfCommerce = null,
        groupFile2 = null,
        groupFileType2 = null,
        representativeForm = null;

  CompanyForm({
    @required this.commercialLicense,
    @required this.commercialRegister,
    @required this.importersRecord,
    @required this.chamberOfCommerce,
    @required this.groupFile2,
    @required this.groupFileType2,
    @required this.representativeForm,
  });
}
