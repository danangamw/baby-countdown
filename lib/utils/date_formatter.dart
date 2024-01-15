import 'package:intl/intl.dart';
import 'package:baby_countdown/core.dart';

String convertDate(DateTime date) {
  return DateFormat('dd MMM yyyy').format(date);
}
