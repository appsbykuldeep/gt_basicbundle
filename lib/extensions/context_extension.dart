import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

extension GTContextextension on BuildContext {
  gtHideKeys() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (MediaQuery.of(this).viewInsets.bottom != 0) {
        FocusScope.of(this).unfocus();
      }
    });
  }

  gtShowKeys() {
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      if (MediaQuery.of(this).viewInsets.bottom == 0) {
        FocusScope.of(this).requestFocus();
      }
    });
  }
}
