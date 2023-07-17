import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

extension GTContextextension on BuildContext {
  void gtHideKeys() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (MediaQuery.of(this).viewInsets.bottom != 0) {
        FocusScope.of(this).unfocus();
      }
    });
  }

  void gtShowKeys() {
    SchedulerBinding.instance.addPersistentFrameCallback((_) {
      if (MediaQuery.of(this).viewInsets.bottom == 0) {
        FocusScope.of(this).requestFocus();
      }
    });
  }
}
