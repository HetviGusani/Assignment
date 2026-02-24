import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

Future<void> main() async{

  await initializeDateFormatting();
  // Current date
  DateTime now = DateTime.now();

  // List of locales
  var locales = ['en_US', 'en_IN', 'hi_IN', 'de_DE', 'fr_FR'];

  print('========== DATE FORMATTING ==========\n');

  for (var locale in locales) {
    var dateFormat = DateFormat.yMMMMd(locale);
    print('$locale -> ${dateFormat.format(now)}');
  }

  print('\n========== NUMBER FORMATTING ==========\n');

  double number = 1234567.89;

  for (var locale in locales) {
    var numberFormat = NumberFormat.decimalPattern(locale);
    print('$locale -> ${numberFormat.format(number)}');
  }

  print('\n========== CURRENCY FORMATTING ==========\n');

  for (var locale in locales) {
    var currencyFormat = NumberFormat.currency(locale: locale, symbol: '');
    print('$locale -> ${currencyFormat.format(number)}');
  }
}