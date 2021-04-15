import 'package:intl/intl.dart';

extension StringExtension on int {
  get toCommasNumber {
    final numberFormat = NumberFormat('##,##0');
    return numberFormat.format(this ?? 0); // number or 0 instead of null
  }
}
