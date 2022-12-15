import 'package:gt_basicbundle/constants/custum_library.dart';

/// Function to show Datepicker popup to take input of Date by user
Future<DateTime?> gtShowDatePickerDilogue({
  required context,
  String? lable,
  String? savelable,
  DateTime? iniitalDate,
  DateTime? firstDate,
  DateTime? lastDate,
  ThemeData? themeData,
  bool canchangedate = true,
}) async {
  if (!canchangedate) return null;
  var date = await showDatePicker(
      context: context,
      helpText: lable,
      confirmText: savelable,
      initialDate: iniitalDate ?? gtDateDiffrence(),
      firstDate: firstDate ?? gtDateDiffrence(years: -2),
      lastDate: lastDate ?? gtDateDiffrence(years: 2),
      builder: (context, child) {
        return Theme(data: themeData ?? ThemeData.light(), child: child!);
      });
  return date;
}
