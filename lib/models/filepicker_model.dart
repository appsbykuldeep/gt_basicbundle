class GtFilePickerModel {
  GtFilePickerModel({
    this.status = false,
    this.pickId = "",
    this.fileName = "",
    this.extension = "",
    this.filePath = "",
    this.errorMessage = "",
    // this.base64File = "",
    // this.listInt,
  });

  bool status;
  String pickId;
  String fileName;
  String extension;
  String filePath;
  String errorMessage;
  // String base64File;
  // List<int>? listInt;

  // factory GtFilePickerModel.fromJson(Map<String, dynamic> json) =>
  //     GtFilePickerModel(
  //       status: json["Status"],
  //       pickId: json["Status"],
  //       fileName: json["FileName"],
  //       extension: json["Extension"],
  //       filePath: json["FilePath"],
  //       base64File: json["Base64file"],
  //       listInt: List<int>.from(json["ListInt"].map((x) => x)),
  //     );

}
