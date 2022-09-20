import 'package:gt_basicbundle/constants/custum_library.dart';

/// Showing popup-Dialoge of Loading screen
gtShowLoading({
  String? lable,
  String? heroid,
  bool lablebyctrl = false,
}) async {
  lable = lable ?? '';
  await Get.dialog(
      WillPopScope(
        onWillPop: () async {
          return !(Get.isDialogOpen ?? false);
        },
        child: Hero(
          tag: heroid ?? "showLoading",
          child: SimpleDialog(
            backgroundColor: Colors.transparent,
            children: [
              Opacity(
                opacity: .8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                      color: Get.theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "assets/icons/loading.gif",
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 600),
      name: "loading");
}
