// import 'package:gt_basicbundle/constants/custum_library.dart';
// import 'package:velocity_x/velocity_x.dart';

// /// Showing dialog for make confirmation in Yes/No
// Future<bool> gtMakeconfirmation({
//   String? titel,
//   String content = "Are you sure ?",
//   bool focusonyes = true,
// }) async {
//   return await showDialog(
//       context: Get.context!,
//       barrierDismissible: false,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: context.backgroundColor,
//           title: Text(
//             (titel ?? "Confirmation"),
//             maxLines: 2,
//             style: TextStyle(
//               color: context.primaryColor,
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           content: Text(
//             content,
//             softWrap: true,
//             maxLines: 3,
//             style: TextStyle(
//               color: context.backgroundColor,
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           actions: [
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 // backgroundColor: focusonyes
//                 //     ? Get.theme.colorScheme.surface
//                 //     : Get.theme.primaryColorDark,
//                 elevation: !focusonyes ? 5 : 0,
//               ),
//               onPressed: () {
//                 Navigator.pop(context, false);
//               },
//               child: Text(
//                 'NO',
//                 style: TextStyle(
//                   color: focusonyes ? Colors.black : Colors.white,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 // backgroundColor: focusonyes
//                 //     ? Get.theme.primaryColorDark
//                 //     : Get.theme.colorScheme.surface,
//                 elevation: focusonyes ? 5 : 0,
//               ),
//               onPressed: () {
//                 Navigator.pop(context, true);
//               },
//               child: Text(
//                 'Yes',
//                 style: TextStyle(
//                   color: focusonyes ? Colors.white : Colors.black,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//           ],
//         );
//       });
// }
