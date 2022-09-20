import 'package:gt_basicbundle/constants/custum_library.dart';

/// functiont to take input of Date range by user using Daterange popup dialoge
Future<DateTimeRange?> gtShowDateRangePickerDilogue({
  required context,
  String? lable,
  DateTimeRange? iniitalDateRange,
  DateTime? firstDate,
  DateTime? lastDate,
  bool canchangedate = true,
}) async {
  if (!canchangedate) return null;
  var date = await showDateRangePicker(
      context: context,
      helpText: lable,
      initialDateRange: iniitalDateRange,
      firstDate: firstDate ?? gtDateDiffrence(years: -2),
      lastDate: lastDate ?? gtDateDiffrence(years: 2),
      builder: (context, child) {
        return Theme(data: ThemeData.light(), child: child!);
      });

  return date;
}
