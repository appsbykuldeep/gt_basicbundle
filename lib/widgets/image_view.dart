import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatefulWidget {
  final String url;
  final String apptitel;
  final String heroId;

  const PhotoViewer(
      {Key? key,
      required this.url,
      this.apptitel = '',
      this.heroId = "PhotoViewerHero"})
      : super(key: key);

  @override
  State<PhotoViewer> createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer> {
  var loadperce = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.apptitel),
        backgroundColor: Colors.transparent,
      ),
      body: PhotoView(
        heroAttributes: PhotoViewHeroAttributes(tag: widget.heroId),
        backgroundDecoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
        ),
        imageProvider: NetworkImage(widget.url),
        customSize: Size(Get.width, Get.height),
        errorBuilder: (context, _, __) {
          return Center(child: Image.asset('assets/icons/no_record.png'));
        },
        loadingBuilder: (context, status) {
          loadperce.value = (((status?.cumulativeBytesLoaded ?? 0) /
                      (status?.expectedTotalBytes ?? 1)) *
                  100)
              .ceilToDouble();
          return const SizedBox();
          // return Obx(
          //   () => LoadingLottie(
          //     repeat: false,
          //     lable: "Loading...${loadperce.value} %",
          //   ),
          // );
        },
      ),
    );
  }
}

class ImageByUrl extends StatelessWidget {
  final String filepath;
  final double? height;
  final double? width;
  const ImageByUrl({Key? key, required this.filepath, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      filepath,
      height: height,
      width: width,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => const _NotFoundImage(),
      loadingBuilder: (context, child, loadingProgress) {
        return child;
      },
    );
  }
}

// class _ErrorImage extends StatelessWidget {
//   const _ErrorImage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Image.asset(
//       AssetsData.images_no_image,
//       fit: BoxFit.cover,
//     );
//   }
// }

class _NotFoundImage extends StatelessWidget {
  const _NotFoundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/icons/no_record.png",
      fit: BoxFit.cover,
    );
  }
}
