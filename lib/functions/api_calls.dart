import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:gt_basicbundle/functions/apiresponse_checker.dart';
import 'package:gt_basicbundle/models/apiresponse_model.dart';
import 'package:http/http.dart' as http;

Future<GTApiResponse> gtBaseApiCall({
  required String url,
  Map<String, dynamic>? apibody,
  Map<String, String>? apiheders,
  bool? bygetmethod,
  int timeout = 60,
}) async {
  GTApiResponse responsemodel = GTApiResponse();

  if (!responsemodel.internetAvailable) {
    responsemodel.errorMsj = "Internet not available";
    responsemodel.haveError = true;
    return responsemodel;
  }
  bygetmethod = bygetmethod ?? false;

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    ...apiheders ?? {},
  };

  apibody = {
    ...apibody ?? {},
  };

  http.Response response;

  try {
    if (bygetmethod) {
      url = url + _maptoquerryParams(apibody);
      response = await http
          .get(
        Uri.parse(url),
        headers: headers,
      )
          .timeout(timeout.seconds, onTimeout: () {
        return http.Response('Request Timeout', 408);
      });
    } else {
      response = await http
          .post(
        Uri.parse(url),
        body: jsonEncode(apibody),
        headers: headers,
      )
          .timeout(timeout.seconds, onTimeout: () {
        return http.Response('Request Timeout', 408);
      });
    }

    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if (response.statusCode == 200) {
      var gotdata = jsonDecode(response.body);
      responsemodel.statusCode = response.statusCode;
      responsemodel.resultStatus =
          ['resultStatus', 'resultstatus'].fetchString(gotdata) == "true";
      responsemodel.resultMsj =
          ['resultMessage', 'resultmessage'].fetchString(gotdata);

      responsemodel.resultData = gtDecodedynamicdata(
          ['resultData', 'resultdata'].fetchdynamic(gotdata));
    } else if (responsemodel.statusCode == 408) {
      responsemodel.resultMsj = "Request Timeout";
    }
  } catch (e) {
    debugPrint("$url : $e");
    responsemodel.haveError = true;
    responsemodel.errorMsj = e.toString();
  }

  return responsemodel;
}

String _maptoquerryParams(Map<String, dynamic> data) {
  String querry = "?";
  data.forEach((key, value) {
    String param = "&$key=$value";
    querry = querry + param;
  });
  return querry;
}

dynamic gtDecodedynamicdata(dynamic resultdata) {
  try {
    if (resultdata.runtimeType == String) {
      resultdata = jsonDecode(resultdata);
    }
  } catch (e) {
    debugPrint("e : _convertResultData");
  }

  return resultdata;
}
