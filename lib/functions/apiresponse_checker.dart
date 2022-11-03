extension KdFetchjsondata on List<String> {
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

String _getString(
    {required List<String> otherkeys, required Map<String, dynamic> jsondata}) {
  final data = _mapConverter(json: jsondata, otherkeys: otherkeys);
  return (data ?? "").toString();
}

dynamic _getdynamic(
    {required List<String> otherkeys, required Map<String, dynamic> jsondata}) {
  return _mapConverter(json: jsondata, otherkeys: otherkeys);
}

dynamic _mapConverter({
  required Map<String, dynamic> json,
  required List<String> otherkeys,
}) {
  otherkeys = otherkeys.map((e) => e.toLowerCase()).toList();

  dynamic result;
  bool isfound = false;
  json.forEach((jsonkey, jsonvalue) {
    jsonkey = jsonkey.toLowerCase();
    if (!isfound) {
      for (var listkey in otherkeys) {
        if (jsonkey == listkey && listkey.isNotEmpty) {
          result = jsonvalue;
          isfound = true;
        }
      }
    }
  });
  return result;
}

double _getDouble(
    {required List<String> otherkeys, required Map<String, dynamic> jsondata}) {
  final data = _mapConverter(json: jsondata, otherkeys: otherkeys);
  if (data.runtimeType is double) {
    return data;
  }
  return double.tryParse(data.toString()) ?? 0;
}

int _getInt(
    {required List<String> otherkeys, required Map<String, dynamic> jsondata}) {
  final data = _mapConverter(json: jsondata, otherkeys: otherkeys);

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

String apiString(dynamic data, {List<dynamic>? other}) {
  String result = '';
  if (data != null) {
    result = data.toString();
  }
  if (other != null) {
    for (var one in other) {
      if (result.isEmpty) {
        result = one.toString();
      }
    }
  }
  return result;
}

double apiDouble(dynamic data, {List<dynamic>? other}) {
  double result = 0;
  if (data != null) {
    result = double.tryParse(data.toString()) ?? 0;
  }
  if (other != null) {
    for (var one in other) {
      if (result == 0) {
        result = double.tryParse(one.toString()) ?? 0;
      }
    }
  }
  return result;
}

int apiInt(dynamic data) {
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
