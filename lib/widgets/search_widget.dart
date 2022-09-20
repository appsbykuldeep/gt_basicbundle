import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchWidget extends StatefulWidget {
  final String? text;
  final ValueChanged<String> onChanged;
  final String? hintText;
  final TextEditingController? searchctrl;
  final EdgeInsetsGeometry? margin;
  // ignore: use_key_in_widget_constructors
  const SearchWidget({
    this.text,
    required this.onChanged,
    this.hintText = 'Search...',
    this.searchctrl,
    this.margin,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late TextEditingController ctrl;
  @override
  void initState() {
    ctrl = widget.searchctrl ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const styleActive = TextStyle(color: Colors.black);
    // const styleHint = TextStyle(color: Colors.black54);

    return Container(
      alignment: Alignment.center,
      height: 42,
      margin: widget.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        border: Border.all(color: Get.theme.colorScheme.primary),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: ctrl,
        cursorColor: Colors.black,
        cursorWidth: 1.5,
        cursorHeight: 18,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Get.theme.colorScheme.primary),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: widget.hintText,
          focusColor: Colors.transparent,
          hintStyle: const TextStyle(
            color: Colors.black45,
          ),
          border: InputBorder.none,
        ),
        style: styleActive,
        onChanged: widget.onChanged,
      ),
    );
  }
}
