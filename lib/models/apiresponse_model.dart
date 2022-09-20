// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';

GTApiResponse apiResponseFromJson(String str) =>
    GTApiResponse.fromJson(json.decode(str));

String apiResponseToJson(GTApiResponse data) => json.encode(data.toJson());

class GTApiResponse {
  GTApiResponse({
    this.statusCode = 0,
    this.haveError = false,
    this.errorMsj = '',
    this.resultStatus = false,
    this.internetAvailable = true,
    this.resultMsj = "",
    this.resultData,
  });

  int statusCode;
  bool haveError;
  String errorMsj;
  bool resultStatus;
  bool internetAvailable;
  String resultMsj;
  dynamic resultData;

  factory GTApiResponse.fromJson(Map<String, dynamic> json) => GTApiResponse(
        statusCode: json["StatusCode"] ?? 0,
        haveError: json["HaveError"] ?? '',
        errorMsj: json["ErrorMsj"] ?? '',
        resultStatus: (json["resultStatus"] ?? "").toString() == "true",
        resultMsj: json["resultMessage"] ?? '',
        resultData: json["resultData"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "HaveError": haveError,
        "ErrorMsj": errorMsj,
        "ResultStatus": resultStatus,
        "ResultMessage": resultMsj,
        "ResultData": resultData,
      };
}
