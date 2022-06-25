import 'package:airsoft/app/modules/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../mixin/constant/textstyle_constant.dart';

class EmailFieldCustom extends StatelessWidget {
  EmailFieldCustom({
    required this.emaiLController,
    required this.hinText,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final controller = Get.find<LoginController>();
  final String hinText;
  final Function(String)? onChanged;
  final TextEditingController emaiLController;
  final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: emaiLController,
          style: Poppins12R,
          decoration: InputDecoration(
            hintStyle: Poppins12R,
            hintText: hinText,
            errorStyle: Poppins12R.copyWith(color: Colors.red),
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
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Color(0xffF0F0F0),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(15.0),
              child: controller.isEmail.value
                  ? SvgPicture.asset(
                      'assets/images/trueemail_svg.svg',
                      height: 10,
                      width: 10,
                    )
                  : SvgPicture.asset(
                      'assets/images/falseemail_svg.svg',
                      height: 10,
                      width: 10,
                    ),
            ),
          ),
          onChanged: (value) {
            if (value.isEmpty) {
              controller.isEmail.value = false;
            } else if (regex.hasMatch(value)) {
              controller.isEmail.value = true;
            } else if (!regex.hasMatch(value)) {
              controller.isEmail.value = false;
            }
          },
        ));
  }
}
