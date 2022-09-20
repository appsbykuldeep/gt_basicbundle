// import 'dart:io';
// import 'package:velocity_x/velocity_x.dart';
// import 'package:mess_consumption/constants/custum_library.dart';
// import 'package:mess_consumption/functions/byte_data_shortner.dart';
// import 'package:mess_consumption/screens/login/login_page.dart';

// String get _lpath => FindCtrl.basic.appDirectorypath;

// Future<void> downloadupdatedapp() async {
//   "wcd13092022.apk".boxlatestappname;
//   "2.0.0".boxlatestversion;
//   if (_isdownloading || _islatest) {
//     final _apppath = "$_lpath/${"".boxlatestappname}";
//     if (await File(_apppath).exists()) {
//       File(_apppath).delete();
//     }
//     return;
//   }



//   await showMessageDilogue(
//       message: "Please update your App !",
//       onclose: () {
//         Get.offAll(() => const LoginPage());
//       });
//   final _ctrl = Get.put(_UpdateCtrl());
//   _ctrl.showdownload.value = false;
//   _ctrl.dowloadpercent.value = 0;
//   _ctrl.dowloadapp();
//   await Get.dialog(
//     _UpdateApp(
//       ctrl: _ctrl,
//     ),
//     barrierDismissible: true,
//   );
//   await Future.delayed(2.seconds);
//   Get.delete<_UpdateCtrl>();
// }

// class _UpdateApp extends StatelessWidget {
//   final _UpdateCtrl ctrl;
//   const _UpdateApp({
//     Key? key,
//     required this.ctrl,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (ctrl.showdownload.value) {
//           return false;
//         }
//         return true;
//       },
//       child: Material(
//         color: Colors.transparent,
//         child: Container(
//           margin:
//               EdgeInsets.symmetric(vertical: Get.height * 0.3, horizontal: 10),
//           height: 160,
//           width: Get.width * 0.9,
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//           decoration: BoxDecoration(
//             color: kdwhite,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               "App Update".textbody(
//                 size: 18,
//                 color: context.primaryColor,
//               ),
//               10.heightBox,
//               "New version of WCD is available. Please install WCD new version ${"".boxlatestversion} for latest feature."
//                   .textbodyregular(
//                 size: 14,
//                 maxlines: 5,
//               ),
//               40.heightBox,
//               Obx(
//                 () => Visibility(
//                   visible: ctrl.showdownload.value,
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           byteDataShortner(
//                             bytes: (ctrl.filesize * ctrl.dowloadpercent.value)
//                                 .toInt(),
//                           ).textbodyregular(
//                             color: context.primaryColor,
//                           ),
//                           const Spacer(),
//                           byteDataShortner(
//                             bytes: (ctrl.filesize).toInt(),
//                           ).textbodyregular(
//                             color: context.primaryColor,
//                           ),
//                         ],
//                       ),
//                       3.heightBox,
//                       LinearProgressIndicator(
//                         backgroundColor: context.primaryColor.withOpacity(0.3),
//                         value: ctrl.dowloadpercent.value == 0
//                             ? null
//                             : ctrl.dowloadpercent.value,
//                       ),
//                       5.heightBox,
//                       "Downloading...".textbodyregular(
//                         color: context.primaryColor,
//                         size: 10,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Obx(
//                 () => Visibility(
//                   visible: !ctrl.showdownload.value,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       ctrl.dowloadapp();
//                     },
//                     child: "Update Now".textbody(
//                       color: kdwhite,
//                       size: 16,
//                     ),
//                   ),
//                 ),
//               ),
//               30.heightBox,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// bool _isdownloading = false;

// class _UpdateCtrl extends GetxService {
//   var dowloadpercent = (0.0).obs;
//   var showdownload = false.obs;
//   int filesize = 0;
//   dowloadapp() async {
//     showdownload.value = true;
//     _isdownloading = true;
//     String _appname = "".boxlatestappname;

//     final _apppath = "$_lpath/$_appname";
//     if (await File(_apppath).exists()) {
//       Get.back();
//       OpenFile.open(_apppath);
//     } else {
//       final _data = await downloadFileByUrl(
//           url: ApiList.baseApi + "/Upload/AppUpdate/" + _appname,
//           name: _appname,
//           onReceiveProgress: (val1, val2) {
//             filesize = val2;
//             dowloadpercent.value = val1 / val2;
//           });
//       Get.back();
//       if (_data.downStatus) {
//         OpenFile.open(_data.filePath);
//       } else {
//         showtostMessage("File Not found !");
//       }
//     }

//     _isdownloading = false;
//   }
// }

// bool get _islatest {
//   double _newlocal = _versionConvert("".boxlatestversion);
//   double _currentlocal = _versionConvert(appVersion);
//   print("_islatest $_newlocal,$_currentlocal");
//   return !(_currentlocal >= _newlocal);
// }

// double _versionConvert(String version) {
//   print("version $version");
//   version = version.toLowerCase();
//   version = version.removeAllWhiteSpace();
//   version = version.replaceAll("debug", "");
//   version = version.replaceAll("app", "");
//   version = version.replaceAll(".", "");

//   return version.toKddouble();
// }
