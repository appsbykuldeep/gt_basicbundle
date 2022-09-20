import 'package:gt_basicbundle/constants/custum_library.dart';

Widget buildDateRangeText({
  required context,
  String? lable,
  String? initialtext,
  required Function(DateTimeRange value) onchange,
  InputBorder? boder,
  InputBorder? focusboder,
  DateTime? iniitalDate,
  DateTime? firstDate,
  DateTime? lastDate,
  TextEditingController? ctrl,
}) {
  TextEditingController wctrl = TextEditingController();

  return SizedBox(
    height: 50,
    child: TextField(
      onTap: () {
        showDateRangePicker(
                context: context,
                helpText: lable,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                initialDateRange: DateTimeRange(
                    start: gtNowdate(), end: gtDateDiffrence(month: 1)),
                firstDate: DateTime(2020),
                lastDate: DateTime(2025))
            .then((value) {
          if (value != null) {
            // _ctrl.text = ddmmyyyyformat.format(value.start) +
            //     " To " +
            //     ddmmyyyyformat.format(value.end);

            onchange(value);
          }
        });
      },
      controller: ctrl ?? wctrl,
      style: const TextStyle(fontSize: 14),
      showCursor: false,
      readOnly: true,
      // enabled: false,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            width: 1,
            color: Get.theme.colorScheme.primary,
          )),
          border: const OutlineInputBorder(),
          suffixIcon: const Icon(Icons.calendar_today)),
    ),
  );
}
