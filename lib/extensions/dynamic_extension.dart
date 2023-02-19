import 'package:gt_basicbundle/constants/custum_library.dart';
import 'package:intl/intl.dart';
import 'package:number_to_words/number_to_words.dart';

extension GTDynamicExtn on dynamic {
  double get togtdouble {
    return (double.tryParse("$this") ?? 0);
  }

  int get togtint {
    return (int.tryParse("$this") ?? 0);
  }

  String get togtString {
    if (this == null) {
      return '';
    } else {
      final type = runtimeType;
      if ((type == int || type == double) && this == 0) {
        return "";
      }

      return "$this";
    }
  }

  String get gtSpelling {
    return "${togtint < 0 ? "minus" : ""}${NumberToWord().convert('en-in', togtint.abs())}"
        .trim()
        .gtProperCase;
  }

  Future<void> get gtDelay async {
    await Future.delayed(Duration(milliseconds: this));
  }

  bool get gtIsString => runtimeType == String;
  bool get gtIsint => runtimeType == int;
  bool get gtIsdouble => runtimeType == double;
  bool get gtIsList => runtimeType.toString().contains("List");

  Widget gtAnimateNumber(
      {String? family,
      double fontsize = 12,
      Color? fontcolor,
      int fractionDigits = 2,
      String prefix = "₹ ",
      Alignment alignment = Alignment.centerLeft,
      Duration duration = const Duration(milliseconds: 400)}) {
    return Align(
      alignment: alignment,
      child: AnimatedFlipCounter(
        value: this,
        duration: duration,
        textStyle: TextStyle(
          fontFamily: family,
          fontSize: fontsize,
          color: fontcolor ?? Colors.black,
          overflow: TextOverflow.ellipsis,
        ),
        fractionDigits: fractionDigits,
        thousandSeparator: ",",
        prefix: prefix,
      ),
    );
  }

  String get gtCurrencyText {
    return "₹ ${NumberFormat("##,##,###.##", "en_US").format(togtdouble)}";
  }

  String get gtThousentText {
    return NumberFormat("##,##,###.##", "en_US").format(togtdouble);
  }

  String gtCustomNumberFormat(String format) {
    return NumberFormat(format, "en_US").format(togtdouble);
  }

  String get gtDateddMMyyformat => _setdatedata("dd-MMM-yyy");

  String get gtDateddmmyyyyhmformat => _setdatedata("dd-MMM-yyy hh:mm a");

  String get gtTimehhmmformat => _setdatedata("hh:mm");

  String get gtTimehhmmAPformat => _setdatedata("hh:mm a");

  String get gtDatemmmyyyyformat => _setdatedata("MMM-yyy");

  String get gtDatemmmmyyyyformat => _setdatedata("MMMM-yyy");

  String get datemmmmformat => _setdatedata("MMMM");

  String get gtDateapiformat => _setdatedata("dd/MM/yyyy");

  String gtcustumDateFormat(String fomat) {
    return _setdatedata(fomat);
  }

  String _setdatedata(String format) {
    String showdate = "";
    final type = DateFormat(format, "en_US");
    try {
      if (runtimeType.toString() == "DateTime") {
        showdate = type.format(this);
      } else {
        showdate = type.format(DateTime.parse(this));
      }
    } catch (e) {
      showdate = "-";
    }
    return showdate;
  }
}

extension MapExtn on Map<String, dynamic> {
  double toMapdouble(String key) {
    var val = this[key];
    return (double.tryParse("$val") ?? 0);
  }

  int toMapint(String key) {
    var val = this[key];
    final type = val.runtimeType;
    if (type is int) {
      return val;
    } else if (type is double) {
      return (val as double).toInt();
    } else {
      return (int.tryParse(val.toString()) ?? 0);
    }
  }

  String toMapString(String key) {
    var val = this[key];
    if (val == null) {
      return '';
    } else {
      return "$val";
    }
  }

  bool containLowerValue(String value) {
    bool have = false;
    forEach((key, datavalue) {
      if (datavalue.toString().toLowerCase().contains(value.toLowerCase())) {
        have = true;
      }
    });
    return have;
  }
}
