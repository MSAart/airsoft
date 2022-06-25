import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../mixin/constant/textstyle_constant.dart';

class TextFieldHome extends StatelessWidget {
  TextFieldHome({
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          prefixIcon: Container(
            padding: EdgeInsets.all(15),
            child: SvgPicture.asset(
              'assets/images/search_svg.svg',
              height: 5,
              width: 5,
            ),
          )),
    );
  }
}

class TextFieldInput extends StatelessWidget {
  TextFieldInput({
    this.textController,
    required this.hinText,
    Key? key,
    this.value,
  }) : super(key: key);
  final String hinText;
  final String? value;
  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        initialValue: value,
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        ),
      ),
    );
  }
}
