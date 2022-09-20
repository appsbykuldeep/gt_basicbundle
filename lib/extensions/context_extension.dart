import 'package:flutter/material.dart';

extension GTContextextension on BuildContext {
  gtHideKeys() {
    if (MediaQuery.of(this).viewInsets.bottom != 0) {
      FocusScope.of(this).unfocus();
    }
  }

  gtShowKeys() {
    if (MediaQuery.of(this).viewInsets.bottom == 0) {
      FocusScope.of(this).requestFocus();
    }
  }
}
