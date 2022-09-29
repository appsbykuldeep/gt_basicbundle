import 'package:gt_basicbundle/models/downloadfile_model.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:dio/dio.dart';

/// future function to download any kind of file by there urls
Future<DownloadFile> gtDownloadFileByUrl({
  required String url,
  bool? innewtab,
  String? name,
  String? savePath,
  Function(int, int)? onReceiveProgress,
}) async {
  DownloadFile backdata = DownloadFile();
  String fileName = url.substring(url.lastIndexOf("/") + 1);
  fileName = fileName.replaceAll("_", "");
  if (name != null) {
    fileName = name;
  }
  Dio dio = Dio();

  try {
    String fullpath = "";
    if (savePath != null) {
      fullpath = "$savePath/$fileName";
    } else {
      var dir = await getApplicationDocumentsDirectory();
      fullpath = "${dir.path}/$fileName";
    }

    final file = File(fullpath);
    var response = await dio.get(url,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0),
        onReceiveProgress: onReceiveProgress);
    final rufffile = file.openSync(mode: FileMode.write);
    rufffile.writeFromSync(response.data);
    await rufffile.close();
    backdata.downStatus = true;
    backdata.filePath = fullpath;
    backdata.unit8Data = response.data;
  } catch (e) {
    backdata.haveerror = true;
  }
  return backdata;
}

// _downloadinWebPlatform() {
//   String content = "";
//   AnchorElement(
//       href: "data:application/octet-stream;charset=utf-16le;base64,$content")
//     ..setAttribute("download", "file.csv")
//     ..click();
// }
