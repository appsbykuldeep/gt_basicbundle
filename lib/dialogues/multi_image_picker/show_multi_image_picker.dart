

// showMultiImagePickerSheet({
//   required String tag,
//   required Function(List<GtFilePickerModel>) onDone,
//   required List<GtFilePickerModel> selectedfiles,
// }) {
//   List<GtFilePickerModel> _local = [];
//   _local = selectedfiles;
//   String ispicked = tag;
//   Get.bottomSheet(_MultiFilePicWid(
//     tag: tag,
//     pickfrom: PickFileType.imagepicker,
//     selectedfiles: _local,
//     sheetTitel: "Select Images",
//     onSelection: (files) {
//       _local = files;
//       ispicked = "true";
//       print("ispicked $ispicked");
//     },
//     onDone: () {
//       Get.back();
//       print("ispicked $ispicked ${_local.length}");
//       if (ispicked == "true") {
//         onDone(_local);
//       }
//     },
//   ));
// }

// class _MultiFilePicWid extends StatelessWidget {
//   final String tag;
//   final String? pickFileLabel;
//   final String? sheetTitel;
//   final Function(List<GtFilePickerModel>) onSelection;
//   final Function() onDone;
//   final List<GtFilePickerModel> selectedfiles;
//   final PickFileType pickfrom;
//   const _MultiFilePicWid({
//     Key? key,
//     required this.tag,
//     this.pickFileLabel,
//     this.sheetTitel,
//     required this.onSelection,
//     required this.onDone,
//     required this.selectedfiles,
//     required this.pickfrom,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: SizedBox(
//         width: Get.width,
//         height: Get.height * 0.6,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: 55,
//                 width: Get.width,
//                 color: context.primaryColor,
//                 padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
//                 alignment: Alignment.centerLeft,
//                 child: Row(
//                   children: [
//                     (sheetTitel ?? "Select Image Files").apptitel().expand(),
//                     5.widthBox,
//                     InkwellTrs(
//                       onTap: onDone,
//                       child: CircleAvatar(
//                         radius: 16,
//                         backgroundColor: kdwhite.withOpacity(0.1),
//                         child: const Icon(
//                           Icons.done,
//                           size: 26,
//                           color: kdwhite,
//                         ),
//                       ),
//                     ),
//                     10.widthBox,
//                     InkwellTrs(
//                       onTap: () {
//                         Get.back();
//                       },
//                       child: CircleAvatar(
//                         radius: 16,
//                         backgroundColor: kdwhite.withOpacity(0.1),
//                         child: const Icon(
//                           Icons.close,
//                           size: 26,
//                           color: kdwhite,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               10.heightBox,
//               MultiFilePickerWid(
//                 pickFileLabel: pickFileLabel,
//                 tag: tag,
//                 selectedfiles: selectedfiles,
//                 canpick: true,
//                 onSelection: onSelection,
//                 pickfrom: pickfrom,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
