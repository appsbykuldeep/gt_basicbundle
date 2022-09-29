import 'dart:io';
import 'dart:typed_data';
import 'package:gt_basicbundle/extensions/string_extension.dart';
import 'package:gt_basicbundle/models/filepicker_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

Future<GtFilePickerModel> gtImageTopdfFile({
  required List<GtFilePickerModel> imagedata,
}) async {
  GtFilePickerModel pdffiledata = GtFilePickerModel();
  try {
    final pdf = pw.Document();
    for (var onedata in imagedata) {
      final oneimage = pw.MemoryImage(
          await (onedata.filePath.gtUnit8ListByPath) as Uint8List);
      pdf.addPage(
        pw.Page(
            pageFormat: PdfPageFormat.a4,
            margin: const pw.EdgeInsets.fromLTRB(5, 5, 5, 5),
            build: (pw.Context context) {
              return _imageToPdfWid(
                image: oneimage,
              );
            }),
      );
    }

    final data = await pdf.save();
    String filename = '${DateTime.now()}_imagetopdf.pdf';
    final dirpath =
        '${(await getApplicationSupportDirectory()).path}/$filename';
    final file = File(dirpath);

    await file.writeAsBytes(data);
    if (imagedata.isNotEmpty) {
      pdffiledata.status = true;
      pdffiledata.filePath = dirpath;
      pdffiledata.extension = "pdf";
      pdffiledata.fileName = filename;
    }
  } catch (e) {
    pdffiledata.status = false;
  }

  return pdffiledata;
}

pw.Widget _imageToPdfWid({
  required pw.MemoryImage image,
}) {
  return pw.Container(
    padding: const pw.EdgeInsets.all(10),
    alignment: pw.Alignment.center,
    child: pw.Image(
      image,
    ),
  );
}
