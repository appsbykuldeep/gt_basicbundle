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
    data.status = true;
    data.fileName = file.files.single.name;
    data.filePath = file.files.single.path!;

    data.extension = data.fileName.gtFileExt;
  }
  return data;
}
