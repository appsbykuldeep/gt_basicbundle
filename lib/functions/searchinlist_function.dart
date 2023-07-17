// import 'package:flutter/cupertino.dart';

// /// Using for filter data from List<Map> & return index of found result
// List<int> gtSearchInList({
//   required List<Map<String, dynamic>> datalist,
//   required String inputvalue,
//   List<String>? ignorekey,
//   List<String>? inkeys,
//   bool? exactmatch,
// }) {
//   List<int> found = [];
//   inkeys ??= [];
//   ignorekey ??= [];

//   // print(datalist);
//   int i = 0;
//   for (var element in datalist) {
//     if (inputvalue.isEmpty) {
//       found.add(i);
//     } else {
//       element.forEach((datakey, datavalue) {
//         if (inkeys!.isNotEmpty) {
//           if (!inkeys.contains(datakey)) {
//             return;
//           }
//         }
//         if (ignorekey!.isNotEmpty) {
//           if (ignorekey.contains(datakey)) {
//             return;
//           }
//         }
//         try {
//           bool result = false;
//           if (exactmatch ?? false) {
//             result =
//                 datavalue.toString().toLowerCase() == inputvalue.toLowerCase();
//           } else {
//             result = datavalue
//                 .toString()
//                 .toLowerCase()
//                 .contains(inputvalue.toLowerCase());
//           }

//           if (result) {
//             found.add(i);
//           }
//         } catch (e) {
//           debugPrint("$e");
//         }
//       });
//     }

//     i++;
//   }

//   return found.toSet().toList();
// }
