import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class DateFormatter {
  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
