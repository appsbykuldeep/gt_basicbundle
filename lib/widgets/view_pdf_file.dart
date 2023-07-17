import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

class ViewPdfFile extends StatefulWidget {
  final PdfDataType dataType;
  final String? filepath;
  final String pagetitel;
  final Uint8List? pdfdata;
  const ViewPdfFile({
    Key? key,
    required this.dataType,
    this.filepath,
    this.pdfdata,
    this.pagetitel = "Pdf File",
  }) : super(key: key);

  @override
  State<ViewPdfFile> createState() => _ViewPdfFileState();
}

class _ViewPdfFileState extends State<ViewPdfFile> {
  var currentPage = 0.obs;
  var totalpageCount = 0.obs;
  late PdfControllerPinch pdfpinchController;
  late Future<PdfDocument> showpdfdata;

  @override
  void initState() {
    if (widget.dataType == PdfDataType.asset) {
      showpdfdata = PdfDocument.openAsset(widget.filepath!);
    } else if (widget.dataType == PdfDataType.filepath) {
      showpdfdata = PdfDocument.openFile(widget.filepath!);
    } else if (widget.dataType == PdfDataType.unit8) {
      showpdfdata = PdfDocument.openData(widget.pdfdata!);
    }
    pdfpinchController = PdfControllerPinch(document: showpdfdata);
    pdfpinchController.addListener(() {
      int total = pdfpinchController.pagesCount ?? 0;
      totalpageCount.value = total;
      currentPage.value = pdfpinchController.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pdfpinchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pagetitel),
        actions: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(0, 5, 15, 5),
            child: Obx(
              () {
                return Text(
                  "${currentPage.value}/${totalpageCount.value} Page",
                );
              },
            ),
          ),
        ],
      ),
      body: PdfViewPinch(
        controller: pdfpinchController,
        builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
          options: const DefaultBuilderOptions(
            loaderSwitchDuration: Duration(seconds: 1),
            transitionBuilder: SomeWidget.transitionBuilder,
          ),
          documentLoaderBuilder: (_) =>
              const Center(child: CircularProgressIndicator()),
          pageLoaderBuilder: (_) =>
              const Center(child: CircularProgressIndicator()),
          errorBuilder: (_, error) => Center(child: Text(error.toString())),
          builder: SomeWidget.builder,
        ),
      ),
    );
  }
}

enum PdfDataType { asset, filepath, unit8 }

// Need static methods for builders arguments
class SomeWidget {
  static Widget builder(
    BuildContext context,
    PdfViewPinchBuilders builders,
    PdfLoadingState state,
    WidgetBuilder loadedBuilder,
    PdfDocument? document,
    Exception? loadingError,
  ) {
    final Widget content = () {
      switch (state) {
        case PdfLoadingState.loading:
          return KeyedSubtree(
            key: const Key('pdfx.root.loading'),
            child: builders.documentLoaderBuilder?.call(context) ??
                const SizedBox(),
          );
        case PdfLoadingState.error:
          return KeyedSubtree(
            key: const Key('pdfx.root.error'),
            child: builders.errorBuilder?.call(context, loadingError!) ??
                Center(child: Text(loadingError.toString())),
          );
        case PdfLoadingState.success:
          return KeyedSubtree(
            key: Key('pdfx.root.success.${document!.id}'),
            child: loadedBuilder(context),
          );
      }
    }();

    final defaultBuilder =
        builders as PdfViewPinchBuilders<DefaultBuilderOptions>;
    final options = defaultBuilder.options;

    return AnimatedSwitcher(
      duration: options.loaderSwitchDuration,
      transitionBuilder: options.transitionBuilder,
      child: content,
    );
  }

  static Widget transitionBuilder(Widget child, Animation<double> animation) =>
      FadeTransition(opacity: animation, child: child);
}
