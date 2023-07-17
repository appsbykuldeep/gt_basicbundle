import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ActionItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color;
  final Function()? onTap;
  const ActionItem(
      {Key? key,
      required this.label,
      required this.icon,
      this.onTap,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(5.0),
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(0.0, 2.0, 5.0, 2.0),
        child: Column(
          children: [
            Icon(
              icon,
              color: color ?? Colors.white,
            ).expand(),
            2.heightBox,
            Text(label),
          ],
        ),
      ),
    );
  }
}
