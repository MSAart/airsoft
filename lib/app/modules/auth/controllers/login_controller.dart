import 'package:airsoft/app/mixin/widgets/logger_widget.dart';
import 'package:airsoft/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../mixin/constant/textstyle_constant.dart';
import '../providers/auth_provider.dart';

class LoginController extends GetxController {
  AuthProvider auth = Get.find<AuthProvider>();
  RxBool hidePassword = true.obs;
  RxBool isEmail = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void login() {
    if (formKey.currentState!.validate()) {
      if (emailController.text.isEmpty) {
        Get.snackbar("", "",
            titleText: Text(
              'Information',
              style: Poppins12M.copyWith(
                color: Color(0xff2e5aac),
              ),
            ),
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
            snackPosition: SnackPosition.BOTTOM,
            messageText: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.info,
                  color: Color(0xff2e5aac),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Please Insert Your Email!',
                  style: Poppins12L.copyWith(color: Color(0xff2e5aac)),
                ),
              ],
            ),
            backgroundColor: Color(0xffeef2fa));
      } else if (passController.text.isEmpty) {
        Get.snackbar("", "",
            titleText: Text(
              'Information',
              style: Poppins12M.copyWith(
                color: Color(0xff2e5aac),
              ),
            ),
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
            snackPosition: SnackPosition.BOTTOM,
            messageText: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.info,
                  color: Color(0xff2e5aac),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Please Insert Your Password!',
                  style: Poppins12L.copyWith(color: Color(0xff2e5aac)),
                ),
              ],
            ),
            backgroundColor: Color(0xffeef2fa));
      } else {
        auth
            .getData(
          emailController.text,
          passController.text,
        )
            .then((result) {
          GetStorage().write('auth', {
            "name": result.data!.name,
            "email": result.data!.email,
            "token": result.data!.token,
          });
          print(result.data!.name);
          print(result.data!.email);
          print(result.data!.token);
          Get.offAllNamed(Routes.HOME);
        }).onError((error, stackTrace) {
          logger.e('LOGIN ERROR', error, stackTrace);
        });
      }
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}
