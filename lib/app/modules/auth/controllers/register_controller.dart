import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../mixin/constant/textstyle_constant.dart';
import '../providers/auth_provider.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  AuthProvider auth = Get.find<AuthProvider>();
  RxBool hidePassword = true.obs;
  RxBool isEmail = false.obs;
  RxBool moreThanEight = false.obs;
  RxBool specialChar = false.obs;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void register() {
    if (formKey.currentState!.validate()) {
      if (nameController.text.isEmpty) {
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
                  'Please Insert Your Name!',
                  style: Poppins12L.copyWith(color: Color(0xff2e5aac)),
                ),
              ],
            ),
            backgroundColor: Color(0xffeef2fa));
      } else if (emailController.text.isEmpty) {
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
            .postData(
          nameController.text,
          emailController.text,
          passController.text,
        )
            .then((result) {
          GetStorage().write('auth', {
            "name": nameController.text,
            "email": emailController.text,
            "token": result.data!.token,
          });
          print(result.data!.name);
          print(result.data!.email);
          print(result.data!.token);
          Get.offAllNamed(Routes.HOME);
        }).onError((error, stackTrace) {
          print(error);
        });
      }
    }
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    passController = TextEditingController();
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    passController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
