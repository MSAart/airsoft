import 'package:airsoft/app/modules/home/controllers/detail_controller.dart';
import 'package:get/get.dart';
import 'package:airsoft/app/modules/home/providers/product_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<DetailController>(
      () => DetailController(),
    );
    Get.lazyPut<ProductProvider>(
      () => ProductProvider(),
    );
  }
}
