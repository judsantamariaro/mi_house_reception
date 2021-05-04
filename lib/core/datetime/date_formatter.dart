import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateFormatter {
  static Future<String> dateFormatted(DateTime date) async {
    await initializeDateFormatting('es_CO');
    return DateFormat.yMMMMEEEEd().format(date);
  }
}
