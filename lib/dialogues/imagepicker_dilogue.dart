import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:gt_basicbundle/constants/custum_library.dart';
import 'package:gt_basicbundle/models/filepicker_model.dart';

/// Showing option from bottom for pick image from Camera / Gallary f
Future<void> gtShowImagePickerSheet({
  required Function(GtFilePickerModel data) ontap,
  bool compress = true,
  int compressQuality = 85,
}) async {
  await Get.bottomSheet(
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
              Expanded(
                child: InkWell(
                  onTap: () async {
                    Get.back();
                    GtFilePickerModel data = await runimagePicker(
                        fromcamera: true, compress: compress);
                    ontap(data);
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            "assets/icons/cameraicon.png",
                            height: 100,
                            fit: BoxFit.cover,
                          )),
                      "Camera".gtTextbody()
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    Get.back();
                    GtFilePickerModel data = await runimagePicker(
                      fromcamera: false,
                      compress: compress,
                      compressQuality: compressQuality,
                    );
                    ontap(data);
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            "assets/icons/gallaryicon.png",
                            height: 100,
                            fit: BoxFit.cover,
                          )),
                      "Gallary".gtTextbody()
                    ],
                  ),
                ),
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
        data.errorMessage = e.toString();
      }
      if (showloading) {
        Get.back();
      }
    }

    if (pickedimagepath.isNotEmpty) {
      try {
        data.status = true;
        data.fileName = file.name.replaceAll("image_picker", "image");
        data.filePath = file.path;
        data.extension = file.path.gtFileExt;
      } catch (e) {
        debugPrint("runimagePicker ::$e");
      }
    } else {}
  }

  return data;
}

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
