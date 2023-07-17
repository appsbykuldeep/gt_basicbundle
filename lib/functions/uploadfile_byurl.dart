// import 'package:dio/dio.dart';
// import 'package:flutter/rendering.dart';
// import 'package:gt_basicbundle/functions/apiresponse_checker.dart';
// import 'package:gt_basicbundle/models/apiresponse_model.dart';
// import 'package:gt_basicbundle/models/filepicker_model.dart';
// import 'package:http_parser/http_parser.dart';
// // import 'package:get/get.dart' hide MultipartFile, FormData;

// Future<GTApiResponse> gtUploadFile({
//   required String filename,
//   required String url,
//   List<GtFilePickerModel>? files,
//   String fileKey = 'file',
//   bool onlySingleFile = false,
//   Map<String, dynamic>? otherdata,
//   Map<String, dynamic>? headerdata,
//   Function(int, int)? onSentProgress,
// }) async {
//   Dio dio = Dio();
//   otherdata = otherdata ?? {};
//   headerdata = headerdata ?? {};

//   Map<String, dynamic> senddata = {
//     ...otherdata,
//   };

//   if (files != null) {
//     if (onlySingleFile && files.isNotEmpty) {
//       senddata[fileKey] = MultipartFile.fromFileSync(
//         files[0].filePath,
//         filename: files[0].fileName,
//         contentType: _getMediaType(files[0]),
//       );
//     } else {
//       senddata[fileKey] = files
//           .map((e) => MultipartFile.fromFileSync(
//                 e.filePath,
//                 filename: e.fileName,
//                 contentType: _getMediaType(e),
//               ))
//           .toList();
//     }
//   }

//   GTApiResponse resp = GTApiResponse();
//   try {
//     final response = await dio.post(url,
//         data: FormData.fromMap(senddata),
//         options: Options(
//           // contentType: 'multipart/form-data',
//           contentType: 'application/json',
//           headers: headerdata,
//         ), onReceiveProgress: (count, total) {
//       // debugPrint("onReceiveProgress : $count : $total");
//     }, onSendProgress: onSentProgress);
//     resp.resultMsj = ['resultMessage'].fetchString(response.data);
//     resp.resultStatus = ['resultStatus'].fetchString(response.data) == "true";
//     resp.statusCode = response.statusCode ?? 0;
//     debugPrint(response.data.toString());
//   } catch (e) {
//     resp.haveError = true;
//     resp.errorMsj = e.toString();
//   }

//   return resp;
// }

// class UploadStatusModel {
//   UploadStatusModel({
//     this.isuploading = false,
//     this.uploadPercentshow = '',
//     this.uploadPercent,
//     this.filesize = 0,
//   });
//   bool isuploading;
//   String uploadPercentshow;
//   double? uploadPercent;
//   int filesize;
// }

// MediaType _getMediaType(GtFilePickerModel data) {
//   String type = "";
//   if (_videoExtList.contains(data.extension)) {
//     type = "video";
//   } else if (_imageExtList.contains(data.extension)) {
//     type = "image";
//   } else if (_audioExtList.contains(data.extension)) {
//     type = "audio";
//   } else {
//     type = "document";
//   }

//   return MediaType(type, data.extension);
// }

// List<String> _videoExtList = [
//   "mp4",
//   "mp4",
//   "3gp",
// ];
// List<String> _imageExtList = ["jpg", "jpeg", "gif"];
// List<String> _audioExtList = ["mp3", "avw"];



// // Future<ApiResponse> uploadFile({
// //   // required String filename,
// //   required String url,
// //   // required List<int> bytedata,
// //   required List<FilePickerModel> files,
// //   Map<String, dynamic>? otherdata,
// //   bool showloading = true,
// // }) async {
// //   Dio dio = Dio();
// //   otherdata = otherdata ?? {};
// //   otherdata = {
// //     // ..._loggedctrl.logedUserDataMap,
// //     ...otherdata,
// //     // "IPAddress": "".boxIPAddress,
// //   };

// //   FormData data = FormData.fromMap({
// //     'Files': files
// //         .map((e) => MultipartFile.fromBytes(
// //               e.listInt ?? [],
// //               filename: e.fileName,
// //             ))
// //         .toList(),
// //     ...otherdata,
// //   });
// //   debugPrint(otherdata.toString());
// //   if (!url.isURL) {}
// //   debugPrint(url);

// //   ApiResponse resp = ApiResponse();
// //   try {
// //     final response = await dio.post(url,
// //         data: data,
// //         options: Options(
// //             // contentType: //'multipart/form-data',
// //             contentType: 'application/json',
// //             headers: {
// //               // "Authorization": "bearer ${"".boxUserToken}",
// //             }), onSendProgress: (count, total) {
// //       debugPrint("$count : $total");
// //     });

// //     debugPrint("response ${response.data}");
// //     resp.resultMsj = (response.data['resultMessage'] ?? '');
// //     if (response.statusCode == 200) {
// //       resp.statusCode = 200;
// //       resp.resultStatus = (response.data['resultStatus'] ?? '') == "true";

// //       var body = response.data;
// //       debugPrint(body.toString());
// //     }
// //   } catch (e) {
// //     debugPrint("uploadFile : $e");
// //     resp.haveError = true;
// //     resp.errorMsj = e.toString();
// //   }

// //   return resp;
// // }
