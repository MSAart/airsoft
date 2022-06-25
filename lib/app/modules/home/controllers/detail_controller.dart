import 'package:get/get.dart';
import '../../../models/detailproduct_model.dart';
import '../../../routes/app_pages.dart';
import '../providers/product_provider.dart';

class DetailController extends GetxController {
  final productProvider = Get.find<ProductProvider>();
  Rx<ProductDetail>? detail = Rx(ProductDetail());
  final count = 0.obs;
  void increment() => count.value++;
  void decrement() => count.value--;

  void detailProduct(int id) async {
    await productProvider.detailProduct(id).then((value) {
      detail!.value.data = value.data;
    });
    Get.toNamed(Routes.DETAIL);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
