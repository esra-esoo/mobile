import 'dart:io';

import 'package:flutter/material.dart';

import 'representative_form.dart';

class CompanyForm {
  File commercialLicense;
  File commercialRegister;
  File importersRecord;
  File chamberOfCommerce;
  File accountStatement;
  RepresentativeForm representativeForm;

  CompanyForm.initial()
      : commercialLicense = null,
        commercialRegister = null,
        importersRecord = null,
        chamberOfCommerce = null,
        accountStatement = null,
        representativeForm = null;

  CompanyForm({
    @required this.commercialLicense,
    @required this.commercialRegister,
    @required this.importersRecord,
    @required this.chamberOfCommerce,
    @required this.accountStatement,
    @required this.representativeForm,
  });
}
