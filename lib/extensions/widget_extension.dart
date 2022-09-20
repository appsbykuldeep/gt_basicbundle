import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

extension WidgetAlignShotcut on Widget {
  /// Wraping widget with DataCell Widget

  DataCell toDataCell({
    bool showEditIcon = false,
    Function()? ontap,
  }) {
    return DataCell(
      this,
      showEditIcon: showEditIcon,
      onTap: ontap,
    );
  }

  /// Wraping widget with Material Widget
  Material materialwrap({
    Color? color,
    Key? key,
  }) {
    return Material(
      key: key,
      color: color ?? Colors.transparent,
      child: this,
    );
  }

  /// Wraping widget with Hero Widget

  Widget heroWrap(String tag) {
    return Hero(
      tag: tag,
      child: Material(
        color: Colors.transparent,
        child: this,
      ),
    );
  }

  Widget gtDelayDisplay(
      {int delay = 150,
      int fadedelay = 300,
      int delaymuliple = 1,
      DelayInFrom infrom = DelayInFrom.bottom}) {
    double x = 0;
    double y = 0;
    if (infrom == DelayInFrom.bottom) {
      y = 0.35;
    }
    if (infrom == DelayInFrom.top) {
      y = -0.35;
    }
    if (infrom == DelayInFrom.left) {
      x = -0.35;
    }
    if (infrom == DelayInFrom.right) {
      x = 0.35;
    }
    return DelayedDisplay(
        slidingBeginOffset: Offset(x, y),
        fadingDuration: Duration(
          milliseconds: fadedelay * delaymuliple,
        ),
        delay: Duration(
          milliseconds: delay * delaymuliple,
        ),
        child: this);
  }
}

enum DelayInFrom { bottom, left, right, top }
