import 'dart:io';

import 'package:flutter/material.dart';

import '../company/authorizer_form.dart';

class CompanyForm {
  File commercialLicense;
  File commercialRegister;
  File importersRecord;
  File chamberOfCommerce;
  File accountStatement;
  AuthorizerForm authorizer;

  CompanyForm.initial()
      : commercialLicense = null,
        commercialRegister = null,
        importersRecord = null,
        chamberOfCommerce = null,
        accountStatement = null,
        authorizer = null;

  CompanyForm({
    @required this.commercialLicense,
    @required this.commercialRegister,
    @required this.importersRecord,
    @required this.chamberOfCommerce,
    @required this.accountStatement,
    @required this.authorizer,
  });
}
