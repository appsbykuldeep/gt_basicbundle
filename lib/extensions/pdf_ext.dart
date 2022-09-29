// // ignore_for_file: unnecessary_this

// import 'dart:typed_data';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:upsrlmapp/models/findgetctrl_model.dart';

// extension PdfwidExtention on pw.Widget {
//   pw.Widget get pdfCenter {
//     return pw.Center(
//       child: this,
//     );
//   }

//   pw.Widget pdfPadLeft({
//     double left = 10,
//   }) {
//     return pw.Padding(padding: pw.EdgeInsets.only(left: left), child: this);
//   }

//   pw.Widget pdfExpand({
//     int flex = 1,
//   }) {
//     return pw.Expanded(child: this, flex: flex);
//   }

//   pw.Widget pdfBorderContainer({
//     double? height,
//     double? width,
//     pw.EdgeInsets padding = const pw.EdgeInsets.fromLTRB(10, 2, 5, 2),
//     pw.Alignment alignment = pw.Alignment.centerLeft,
//     bool showborder = true,
//     PdfColor? color,
//   }) {
//     return pw.Container(
//         child: this,
//         padding: padding,
//         height: height,
//         width: width,
//         alignment: alignment,
//         decoration: pw.BoxDecoration(
//           color: color,
//           border: !showborder
//               ? null
//               : pw.Border.all(
//                   width: .8,
//                 ),
//         ));
//   }

//   pw.Widget pdfFitBox() {
//     return pw.FittedBox(child: this);
//   }

//   pw.Widget pdfWidthBox(double width) {
//     return pw.SizedBox(width: width);
//   }
// }

// extension PdfStrinExtention on String {
//   pw.Widget pdfText({
//     String text = '',
//     double fontsize = 10,
//     pw.FontWeight fontWeight = pw.FontWeight.normal,
//     pw.TextAlign textAlign = pw.TextAlign.left,
//     Uint8List? fontdata,
//     PdfColor? textcolor,
//   }) {
//     fontdata = fontdata ?? FindCtrl.baseservices.regularfontunitList!;
//     pw.Font font = pw.Font.ttf(fontdata.buffer.asByteData());
//     return pw.Text(this,
//         textAlign: textAlign,
//         // softWrap: true,
//         maxLines: 10,
//         overflow: pw.TextOverflow.span,
//         style: pw.TextStyle(
//           fontSize: fontsize,
//           font: font,
//           color: textcolor,
//           fontWeight: fontWeight,
//         ));
//   }
// }

// extension PdfnumExtention on num {
//   pw.Widget get pdfheighbox {
//     return pw.SizedBox(
//       height: this.toDouble(),
//     );
//   }

//   pw.Widget get pdfwidthbox {
//     return pw.SizedBox(
//       width: this.toDouble(),
//     );
//   }

//   pw.Widget pdfDivier({
//     double height = 5,
//   }) {
//     return pw.Divider(thickness: this.toDouble(), height: height);
//   }
// }
