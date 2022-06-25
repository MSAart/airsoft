import 'package:airsoft/app/mixin/constant/color_constant.dart';
import 'package:airsoft/app/modules/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../mixin/constant/textstyle_constant.dart';

class PassFieldCustom extends StatelessWidget {
  PassFieldCustom({
    required this.passController,
    required this.hinText,
    Key? key,
  }) : super(key: key);

  final controller = Get.find<LoginController>();
  final String hinText;
  final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          controller: passController,
          obscureText: controller.hidePassword.value,
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
              suffixIcon: (IconButton(
                  onPressed: () {
                    controller.hidePassword.value =
                        !controller.hidePassword.value;
                  },
                  icon: controller.hidePassword.value
                      ? const Icon(
                          Icons.visibility_rounded,
                          size: 20,
                          color: Color(0xff737373),
                        )
                      : const Icon(
                          Icons.visibility_rounded,
                          size: 20,
                          color: secondColor,
                        )))),
        ));
  }
}
