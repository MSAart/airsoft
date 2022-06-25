import 'package:flutter/material.dart';
import '../../../mixin/constant/textstyle_constant.dart';

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom({
    required this.textController,
    required this.hinText,
    Key? key,
  }) : super(key: key);
  final String hinText;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      style: Poppins12R,
      decoration: InputDecoration(
        hintStyle: Poppins12R,
        hintText: hinText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Color(0xffF0F0F0),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      ),
    );
  }
}
