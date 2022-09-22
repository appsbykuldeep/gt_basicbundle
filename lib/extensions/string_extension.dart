import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gt_basicbundle/extensions/dynamic_extension.dart';

extension KdStringExt on String {
  Widget gtApptitel({
    double? size,
    Color? color,
    int? maxline,
  }) {
    return Text(
      this,
      maxLines: maxline,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: size ?? 18,
        color: color,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget gtApptitelWithRange({DateTimeRange? date}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: gtApptitel(
            size: 14,
          ),
        ),
        Visibility(
          visible: date != null,
          child: Flexible(
            child: _getDateRangeTxt(date).gtApptitel(size: 10),
          ),
        ),
      ],
    );
  }

  Widget gtTextbody(
      {double? size,
      Color? color,
      int? maxline,
      TextAlign? textAlign,
      int? weight}) {
    return Text(
      this,
      maxLines: maxline,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
        fontSize: size ?? 12,
        color: color ?? Colors.black,
        fontWeight: _setfontWeight(weight),
      ),
    );
  }

  // IconData get getfileIconData {
  //   if (audioExtList.contains(this)) {
  //     return Icons.audio_file;
  //   }
  //   if (imageExtList.contains(this)) {
  //     return Icons.image;
  //   }
  //   if (videoExtList.contains(this)) {
  //     return Icons.movie;
  //   }
  //   if ([
  //     "pdf",
  //   ].contains(this)) {
  //     return Icons.picture_as_pdf;
  //   }

  //   return Icons.file_copy;
  // }

  void get gtShowtost {
    if (isEmpty) return;
    Fluttertoast.showToast(
        msg: this,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        fontSize: 12.0);
  }

  String get gtFileExt {
    List<String> parts = split(".");
    if (parts.isNotEmpty) {
      return parts.last;
    }
    return "";
  }

  Future<List<int>> get gtUnit8ListByPath async {
    final file = File(this);
    if (await file.exists()) {
      return file.readAsBytesSync();
    } else {
      return [];
    }
  }

  Future<String> get gtBase64ByPath async {
    final file = File(this);
    if (await file.exists()) {
      return base64Encode(file.readAsBytesSync());
    } else {
      return "";
    }
  }

  Future<bool> get gtIsFileExists async {
    return await File(this).exists();
  }

  // String get attachBaseApi {
  //   final status = contains(ApiList.baseApiVideo);
  //   String url = this;
  //   if (!status) {
  //     url = ApiList.baseApiVideo + this;
  //   }

  //   url = url.replaceAll(".in//", ".in/");

  //   return url;
  // }

  String get countryFlagEmojicountryCode {
    final String currencyFlag = this;
    // 0x41 is Letter A
    // 0x1F1E6 is Regional Indicator Symbol Letter A
    // Example :
    // firstLetter U => 20 + 0x1F1E6
    // secondLetter S => 18 + 0x1F1E6
    // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
    final int firstLetter = currencyFlag.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = currencyFlag.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }

  String get gtProperCase {
    return replaceAll(RegExp(' +'), ' ')
        .split(" ")
        .map((str) => inCaps(str))
        .join(" ");
  }

  String inCaps(String value) => value.isNotEmpty
      ? '${value[0].toUpperCase()}${value.toLowerCase().substring(1)}'
      : '';
}

FontWeight _setfontWeight(int? weight) {
  if (weight != null) {
    if (weight == 3) {
      return FontWeight.w300;
    }
    if (weight == 4) {
      return FontWeight.w400;
    }
    if (weight == 5) {
      return FontWeight.w500;
    }
    if (weight == 6) {
      return FontWeight.w600;
    }
    if (weight == 7) {
      return FontWeight.w700;
    }
    if (weight == 8) {
      return FontWeight.w800;
    }
    if (weight == 9) {
      return FontWeight.w900;
    }
  }
  return FontWeight.w400;
}

String _getDateRangeTxt(DateTimeRange? date) {
  if (date == null) {
    return "";
  } else {
    return "(${date.start.gtDateddMMyyformat} To ${date.end.gtDateddMMyyformat})";
  }
}
