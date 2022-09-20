import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:gt_basicbundle/constants/custum_library.dart';
import 'package:gt_basicbundle/models/filepicker_model.dart';

/// Showing option from bottom for pick image from Camera / Gallary f
gtShowImagePickerSheet({
  required Function(GtFilePickerModel data) ontap,
  bool compress = true,
}) {
  Get.bottomSheet(
    Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.surface,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          "Select a image from".gtTextbody(
            size: 14,
            color: Get.theme.colorScheme.primary,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              InkWell(
                onTap: () async {
                  Get.back();
                  GtFilePickerModel data = await runimagePicker(
                      fromcamera: true, compress: compress);
                  ontap(data);
                },
                child: Expanded(
                    child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "",
                          height: 100,
                          fit: BoxFit.cover,
                        )),
                    "Camera".gtTextbody()
                  ],
                )),
              ),
              InkWell(
                onTap: () async {
                  Get.back();
                  GtFilePickerModel data = await runimagePicker(
                      fromcamera: false, compress: compress);
                  ontap(data);
                },
                child: Expanded(
                    child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "",
                          height: 100,
                          fit: BoxFit.cover,
                        )),
                    "Gallary".gtTextbody()
                  ],
                )),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

int _pickerId = 245;

/// function for pick image using image picker
Future<GtFilePickerModel> runimagePicker({
  required bool fromcamera,
  bool compress = false,
  bool showloading = false,
  int compressQuality = 85,
}) async {
  GtFilePickerModel data = GtFilePickerModel();
  data.pickId = (_pickerId++).toString();
  final ImagePicker picker = ImagePicker();
  XFile? file;
  if (fromcamera) {
    file = await picker.pickImage(source: ImageSource.camera);
  } else {
    file = await picker.pickImage(source: ImageSource.gallery);
  }
  if (file != null) {
    String pickedimagepath = file.path;
    if (compress) {
      if (showloading) {
        gtShowLoading(lable: 'Compressing image...');
      }
      final compPath = await getTemporaryDirectory();

      try {
        var result = await FlutterImageCompress.compressAndGetFile(
            file.name, compPath.path,
            quality: 88,
            minWidth: Get.width.toInt(),
            minHeight: Get.height.toInt(),
            // rotate: 180,
            numberOfRetries: 3);
        if (result != null) {
          pickedimagepath = result.path;
        }
      } catch (e) {
        debugPrint("compressAndGetFile : $e");
      }
      if (showloading) {
        Get.back();
      }
    }

    if (pickedimagepath.isNotEmpty) {
      try {
        final filedata = File(pickedimagepath);
        List<int> fileint = filedata.readAsBytesSync();
        String base64 = base64Encode(fileint);
        data.status = true;
        data.fileName = file.name.replaceAll("image_picker", "upsrlm");
        data.filePath = file.path;
        data.listInt = filedata.readAsBytesSync();
        data.base64File = base64;
        data.extension = file.path.gtFileExt;
      } catch (e) {
        debugPrint("runimagePicker ::$e");
        'Something is wrong\nPlease try again...'.gtShowtost;
      }
    } else {
      'File path not found.'.gtShowtost;
    }
  }

  return data;
}

// Future<FilePickerModel> trycompressImageFile({
//   required FilePickerModel data,
// }) async {
//   try {
//     final _compPath = await getTemporaryDirectory();
//     CompressObject compressObject = CompressObject(
//       imageFile: File(data.filePath),
//       path: _compPath.path,
//       quality: 85,
//       step: 9,
//       mode: CompressMode.LARGE2SMALL,
//     );

//     String compresspath = await Luban.compressImage(compressObject) ?? '';

//     if (compresspath.isNotEmpty) {
//       data.filePath = compresspath;
//       data.fileName = compresspath.split("/").last;
//     }
//     return data;
//   } catch (e) {
//     return data;
//   }
// }

Future<GtFilePickerModel> trycompressImageFile({
  required GtFilePickerModel data,
}) async {
  var result = await FlutterImageCompress.compressAndGetFile(
      data.filePath, data.filePath.replaceAll(data.fileName, ""),
      quality: 88,
      minWidth: Get.width.toInt(),
      minHeight: Get.height.toInt(),
      numberOfRetries: 3);
  if (result != null) {
    data.filePath = result.path;
    data.fileName = result.path.split("/").last;
    data.extension = data.fileName.gtFileExt;
  }

  return data;
}
