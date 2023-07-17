extension GTFetchjsondata on List<String> {
  String fetchString(Map<String, dynamic> jsondata) {
    return _getString(
      otherkeys: this,
      jsondata: jsondata,
    ).trim();
  }

  double fetchdouble(Map<String, dynamic> jsondata) {
    return _getDouble(
      otherkeys: this,
      jsondata: jsondata,
    );
  }

  int fetchint(Map<String, dynamic> jsondata) {
    return _getInt(
      otherkeys: this,
      jsondata: jsondata,
    );
  }

  dynamic fetchdynamic(Map<String, dynamic> jsondata) {
    return _getdynamic(
      otherkeys: this,
      jsondata: jsondata,
    );
  }
}

extension GTFetchjsondataFromString on String {
  String fetchString(Map<String, dynamic> jsondata) {
    return _getString(
      otherkeys: [this],
      jsondata: jsondata,
    ).trim();
  }

  double fetchdouble(Map<String, dynamic> jsondata) {
    return _getDouble(
      otherkeys: [this],
      jsondata: jsondata,
    );
  }

  int fetchint(Map<String, dynamic> jsondata) {
    return _getInt(
      otherkeys: [this],
      jsondata: jsondata,
    );
  }

  dynamic fetchdynamic(Map<String, dynamic> jsondata) {
    return _getdynamic(
      otherkeys: [this],
      jsondata: jsondata,
    );
  }
}

String _getString(
    {required List<String> otherkeys, required Map<String, dynamic> jsondata}) {
  final data = _valueFetcher(json: jsondata, otherkeys: otherkeys);
  return (data ?? "").toString();
}

dynamic _getdynamic(
    {required List<String> otherkeys, required Map<String, dynamic> jsondata}) {
  return _valueFetcher(json: jsondata, otherkeys: otherkeys);
}

dynamic _valueFetcher({
  required dynamic json,
  required List<String> otherkeys,
}) {
  try {
    otherkeys = otherkeys.map((e) => e.toLowerCase()).toList();
    return (json as Map<String, dynamic>)
        .entries
        .firstWhere((e) => otherkeys.contains(e.key.toLowerCase()))
        .value;
  } catch (e) {
    return null;
  }
}

double _getDouble(
    {required List<String> otherkeys, required Map<String, dynamic> jsondata}) {
  final data = _valueFetcher(json: jsondata, otherkeys: otherkeys);
  if (data.runtimeType is double) {
    return data;
  }
  return double.tryParse(data.toString()) ?? 0;
}

int _getInt(
    {required List<String> otherkeys, required Map<String, dynamic> jsondata}) {
  final data = _valueFetcher(json: jsondata, otherkeys: otherkeys);

  if (data != null) {
    final type = data.runtimeType;
    if (type is double) {
      return (data as double).toInt();
    } else if (type is int) {
      return data;
    } else {
      return int.tryParse(data.toString()) ?? 0;
    }
  }
  return 0;
}
