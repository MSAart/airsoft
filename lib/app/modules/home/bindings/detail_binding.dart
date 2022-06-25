import 'package:airsoft/app/modules/home/controllers/detail_controller.dart';
import 'package:airsoft/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:airsoft/app/modules/transaction/providers/transaction_provider.dart';
import 'package:get/get.dart';
import '../controllers/edit_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(
      () => TransactionController(),
    );
    Get.lazyPut<DetailController>(
      () => DetailController(),
    );
    Get.lazyPut<TransactionProvider>(
      () => TransactionProvider(),
    );
    Get.lazyPut<EditController>(
      () => EditController(),
    );
  }
}
