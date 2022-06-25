import 'package:airsoft/app/modules/auth/controllers/login_controller.dart';
import 'package:get/get.dart';

import '../providers/auth_provider.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AuthProvider>(() => AuthProvider());
  }
}
