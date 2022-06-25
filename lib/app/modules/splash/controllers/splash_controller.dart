import 'dart:async';
import 'package:airsoft/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  GetStorage storage = GetStorage();

  startSplash() {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      if (storage.hasData("auth")) {
        Get.offAllNamed(Routes.HOME);
      } else {
        print('ok');
        Get.offAllNamed(Routes.LOGIN);
      }
    });
  }

  @override
  void onReady() {
    startSplash();
    super.onReady();
  }
}
