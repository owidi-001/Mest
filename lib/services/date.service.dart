import 'package:intl/intl.dart';

String dateFormat() {
  var date = DateTime.now();
  // print(date.toString()); // prints something like 2019-12-10 10:02:22.287949
  // print(DateFormat('EEEE').format(date)); // prints Tuesday
  // print(DateFormat('EEEE, d MMM, yyyy')
  //     .format(date)); // prints Tuesday, 10 Dec, 2019
  // print(DateFormat('h:mm a').format(date)); // prints 10:02

  var dayOfWeek = DateFormat('EEEE').format(date);
  var month = DateFormat('MMM').format(date);
  var day = DateFormat('d').format(date);

  return "$dayOfWeek, $month $day";
}
