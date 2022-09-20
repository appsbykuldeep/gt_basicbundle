import 'package:flutter/material.dart';
import 'package:gt_basicbundle/extensions/string_extension.dart';
import 'package:gt_basicbundle/extensions/widget_extension.dart';
import 'package:velocity_x/velocity_x.dart';

class PopupRow extends StatelessWidget {
  final IconData icondata;
  final String lable;
  const PopupRow({Key? key, required this.icondata, required this.lable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icondata,
          color: context.primaryColor,
          size: 20,
        ),
        2.widthBox,
        lable.gtTextbody()
      ],
    ).gtDelayDisplay();
  }
}
