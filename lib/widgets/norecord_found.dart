import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoRecordFound extends StatelessWidget {
  final bool isloading;
  final double? height;
  final double? width;
  const NoRecordFound(
      {Key? key, this.isloading = false, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        width: width ?? Get.width,
        height: height ?? Get.height - 200,
        child: AnimatedCrossFade(
          duration: 600.milliseconds,
          reverseDuration: 200.milliseconds,
          crossFadeState:
              !isloading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          secondChild: Container(
              padding: const EdgeInsets.all(5),
              height: 50,
              width: 50,
              child: const CircularProgressIndicator()),
          firstChild: Image.asset(
            "",
            height: 200,
            width: 400,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
