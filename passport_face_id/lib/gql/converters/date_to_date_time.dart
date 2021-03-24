import 'package:intl/intl.dart';

final format = DateFormat('yyyy-MM-dd');

DateTime fromGraphQLDateToDartDateTime(String value) => format.parse(value);

String fromDartDateTimeToGraphQLDate(DateTime value) => format.format(value);
