import 'dart:convert';

GtFilePickerModel filePickerModelFromJson(String str) =>
    GtFilePickerModel.fromJson(json.decode(str));

String filePickerModelToJson(GtFilePickerModel data) =>
    json.encode(data.toJson());

class GtFilePickerModel {
  GtFilePickerModel({
    this.status = false,
    this.pickId = "",
    this.fileName = "",
    this.extension = "",
    this.filePath = "",
    this.base64File = "",
    this.listInt,
  });

  bool status;
  String pickId;
  String fileName;
  String extension;
  String filePath;
  String base64File;
  List<int>? listInt;

  factory GtFilePickerModel.fromJson(Map<String, dynamic> json) =>
      GtFilePickerModel(
        status: json["Status"],
        pickId: json["Status"],
        fileName: json["FileName"],
        extension: json["Extension"],
        filePath: json["FilePath"],
        base64File: json["Base64file"],
        listInt: List<int>.from(json["ListInt"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "FileName": fileName,
        "Extension": extension,
        "FilePath": filePath,
        "Base64file": base64File,
        "ListInt": List<dynamic>.from(listInt!.map((x) => x)),
      };
}
