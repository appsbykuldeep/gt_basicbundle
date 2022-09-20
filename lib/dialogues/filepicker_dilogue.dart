import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:gt_basicbundle/extensions/string_extension.dart';
import 'package:gt_basicbundle/models/filepicker_model.dart';

/// funciton to pick Files Like 'jpg', 'pdf', 'png', 'jpeg', 'doc', 'docx'
Future<GtFilePickerModel> gtRunFilePicker({
  List<String>? extenstions,
  String? dialogTitle,
}) async {
  GtFilePickerModel data = GtFilePickerModel();
  extenstions = extenstions ?? ['jpg', 'pdf', 'png', 'jpeg', 'doc', 'docx'];
  FilePickerResult? file = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: extenstions,
  );

  if (file != null) {
    final filedata = File(file.files.single.path!);
    List<int> fileint = filedata.readAsBytesSync();
    String base64 = base64Encode(fileint);
    data.status = true;
    data.fileName = file.files.single.name;
    data.filePath = file.files.single.path!;
    data.listInt = filedata.readAsBytesSync();
    data.base64File = base64;
    data.extension = data.fileName.gtFileExt;
  }
  return data;
}
