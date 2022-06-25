import 'package:airsoft/app/mixin/constant/color_constant.dart';
import 'package:airsoft/app/modules/auth/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../mixin/constant/textstyle_constant.dart';
import 'circlechk_widget.dart';

class PassRegisCustom extends StatelessWidget {
  PassRegisCustom({
    required this.passController,
    required this.hinText,
    Key? key,
  }) : super(key: key);

  final controller = Get.find<RegisterController>();
  final String hinText;
  final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          TextFormField(
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
            onChanged: (value) {
              RegExp specialChar = RegExp(r'^(?=.*?[#?!@$%^&*-])');
              if (value.isEmpty) {
                controller.specialChar.value = false;
                controller.moreThanEight.value = false;
              }
              if (specialChar.hasMatch(value)) {
                controller.specialChar.value = true;
              } else {
                controller.specialChar.value = false;
              }
              if (value.length >= 8) {
                controller.moreThanEight.value = true;
              } else {
                controller.moreThanEight.value = false;
              }
            },
          ),
          SizedBox(
            height: 15,
          ),
          CircleCheck(
            condition: controller.specialChar.value,
            textcheck: 'Using Special Characters',
          ),
          CircleCheck(
            condition: controller.moreThanEight.value,
            textcheck: 'More than 8 Characters',
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
