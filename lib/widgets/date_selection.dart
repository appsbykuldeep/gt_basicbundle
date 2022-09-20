import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildDateText({
  required context,
  String? lable,
  String? initialtext,
  required Function(DateTime value) onchange,
  InputBorder? boder,
  InputBorder? focusboder,
  DateTime? iniitalDate,
  DateTime? firstDate,
  DateTime? lastDate,
  Widget? prefixicon,
  bool canchangedate = true,
  TextEditingController? controller,
}) {
  TextEditingController ctrl = controller ?? TextEditingController();
  if (initialtext != null) {
    ctrl.text = initialtext;
  }

  return SizedBox(
    height: 50,
    child: TextField(
      onTap: () {
        if (!canchangedate) return;
        showDatePicker(
                context: context,
                helpText: lable,
                initialDate: iniitalDate ?? DateTime.now(),
                firstDate: firstDate ?? DateTime(2020),
                lastDate: lastDate ?? DateTime(2030))
            .then((value) {
          if (value != null) {
            // _ctrl.text = ddmmyyyyformat.format(value);
            onchange(value);
          }
        });
      },
      controller: ctrl,
      style: const TextStyle(fontSize: 14, color: Colors.black),
      showCursor: false,
      readOnly: true,
      // enabled: false,
      decoration: InputDecoration(
          focusedBorder: focusboder ??
              OutlineInputBorder(
                  borderSide: BorderSide(
                width: 1,
                color: Get.theme.colorScheme.primary,
              )),
          border: boder ?? const OutlineInputBorder(),
          labelText: lable,
          prefixIcon: prefixicon,
          labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
          suffixIcon: const Icon(Icons.calendar_today)),
    ),
  );
}
