

import 'package:gt_basicbundle/constants/custum_library.dart';
import 'package:gt_basicbundle/dialogues/filepicker_dilogue.dart';
import 'package:gt_basicbundle/dialogues/imagepicker_dilogue.dart';
import 'package:gt_basicbundle/models/filepicker_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:getwidget/getwidget.dart';

late _MultiFilePickerCtrl _ctrl;
enum PickFileType { none, filepicker, imagepicker }
class MultiFilePickerWid extends StatelessWidget {
  final bool canpick;
  final String tag;
  final String? pickFileLabel;
  final Function(List<GtFilePickerModel>) onSelection;
  final List<GtFilePickerModel> selectedfiles;
  final PickFileType pickfrom;
  const MultiFilePickerWid({
    Key? key,
    required this.canpick,
    required this.onSelection,
    required this.selectedfiles,
    required this.tag,
    this.pickFileLabel,
    this.pickfrom = PickFileType.filepicker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _ctrl = Get.put(_MultiFilePickerCtrl(), tag: tag);
    _ctrl.pickedfiles.value = selectedfiles;
    return Obx(() => Column(
          // key: ValueKey(
          //     "${_ctrl.pickedfiles.length} $tag _MultiFilePickerCtrl_Column1 "),
          children: [
            ...List.generate(
                _ctrl.pickedfiles.length,
                (index) => _PickedFileCard(
                      onedata: _ctrl.pickedfiles[index],
                      index: index,
                      canremove: canpick,
                      onSelection: onSelection,
                    )),
            3.heightBox,
            Visibility(
              visible: canpick,
              child: _FilePicWid(
                pickFileLabel: pickFileLabel,
                onSelection: onSelection,
                pickfrom: pickfrom,
              ),
            ),
          ],
        ));
  }
}

class _MultiFilePickerCtrl extends GetxController {
  var pickedfiles = <GtFilePickerModel>[].obs;

  addFile(
      GtFilePickerModel data, Function(List<GtFilePickerModel>) onSelection) async {
    if (data.status) {
      bool iselected = _ctrl.pickedfiles
          .filter((element) => element.fileName == data.fileName)
          .isNotEmpty;
      if (iselected) {
        final type = data.extension.getfileType;
        ("$type alredy selected ! ").gtShowtost;
      } else {
        _ctrl.pickedfiles.value = [
          data,
          ..._ctrl.pickedfiles,
        ];
        onSelection(_ctrl.pickedfiles);
      }
    }
  }
}

class _PickedFileCard extends StatelessWidget {
  final GtFilePickerModel onedata;
  final bool canremove;
  final int index;
  final Function(List<GtFilePickerModel>) onSelection;
  const _PickedFileCard({
    Key? key,
    required this.onedata,
    required this.canremove,
    required this.index,
    required this.onSelection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!canremove) {
          // final type = onedata.extension.getfileType;
          // openFileByExt(onedata.filePath);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.only(bottom: 8),
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            width: 0.4,
            color: context.primaryColor,
          ),
        ),
        child: Row(
          children: [
            Icon(
              onedata.extension.getfileIconData,
              color: context.primaryColor,
            ),
            3.widthBox,
            onedata.fileName.gtTextbody().expand(),
            5.widthBox,
            Visibility(
              visible: !canremove,
              replacement: InkWell(
                onTap: () {
                  if (canremove) {
                    _ctrl.pickedfiles.removeAt(index);
                    onSelection(_ctrl.pickedfiles);
                  }
                },
                child: Icon(
                  Icons.close,
                  color: context.primaryColor,
                ),
              ),
              child: Icon(
                Icons.visibility,
                color: context.primaryColor,
              ),
            ),
            5.widthBox,
          ],
        ),
      ),
    );
  }
}

class _FilePicWid extends StatelessWidget {
  final Function(List<GtFilePickerModel>) onSelection;
  final String? pickFileLabel;
  final PickFileType pickfrom;
  const _FilePicWid({
    Key? key,
    required this.onSelection,
    this.pickFileLabel,
    required this.pickfrom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        GtFilePickerModel data = GtFilePickerModel();

        if (pickfrom == PickFileType.filepicker) {
          data = await gtRunFilePicker();
          _ctrl.addFile(data, onSelection);
        } else if (pickfrom == PickFileType.imagepicker) {
          await gtShowImagePickerSheet(ontap: (file) {
            _ctrl.addFile(file, onSelection);
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: GFBorder(
          color: context.primaryColor,
          dashedLine: const [4, 6],
          type: GFBorderType.rect,
          child: Row(
            children: [
              (pickFileLabel ?? "Add File")
                  .gtTextbody(
                    size: 14,
                    color: context.primaryColor,
                  )
                  .expand(),
              5.widthBox,
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(65),
                  border: Border.all(
                    width: 0.5,
                    color: context.primaryColor,
                  ),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.add,
                  color: context.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
