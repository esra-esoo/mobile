import 'package:intl/intl.dart';

extension StringExtension on String {
  get toNumber {
    return int.tryParse(this) ?? 0; // number or 0 instead of null
  }

  get toDouble {
    return double.tryParse(this) ?? 0.0; // number or 0 instead of null
  }

  get toBoolean {
    return this == 'true';
  }

  get toMoney {
    final numberFormat = NumberFormat('##,##0.000');
    return numberFormat
        .format(double.tryParse(this) ?? 0.0); // number or 0 instead of null
  }

  get isValidPhonenumber {
    RegExp regExp = RegExp(r'^(09)[0-9]{8}$');
    return regExp.hasMatch(this);
  }

  get isStrongPassword {
    RegExp regExp = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%#^?&])[A-Za-z\d@$!%#^?&]{8,}$');
    return regExp.hasMatch(this);
  }

  get toCapitalize {
    if (this.isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + this.substring(1);
  }
}
