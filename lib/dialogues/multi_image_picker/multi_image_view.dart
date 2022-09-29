import 'package:gt_basicbundle/constants/custum_library.dart';
import 'package:gt_basicbundle/widgets/image_view.dart';
import 'package:velocity_x/velocity_x.dart';

class MultiImageViewWid extends StatelessWidget {
  final List<String> urllist;
  final String title;
  const MultiImageViewWid(
      {Key? key, required this.urllist, this.title = "Images"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title.gtApptitel()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              urllist.length,
              (index) => _NetworkImage(
                url: urllist[index],
                title: title,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _NetworkImage extends StatelessWidget {
  final String url;
  final String title;
  const _NetworkImage({Key? key, required this.url, this.title = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => PhotoViewer(
            url: url,
            apptitel: title,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          width: 1,
          color: context.primaryColor,
        ))),
        child: Image.network(
          url,
          height: Get.height,
          width: Get.width,
          // fit: BoxFit.cover,
          errorBuilder: (context, _, __) {
            return Center(
                child:
                    Image.asset('assets/icons/pngfiles/image_not_found.png'));
          },
        ),
      ),
    );
  }
}
