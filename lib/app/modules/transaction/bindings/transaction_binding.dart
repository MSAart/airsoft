import 'package:get/get.dart';

import 'package:airsoft/app/modules/transaction/controllers/detailtransaction_controller.dart';
import 'package:airsoft/app/modules/transaction/providers/transaction_provider.dart';

import '../controllers/transaction_controller.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailtransactionController>(
      () => DetailtransactionController(),
    );
    Get.lazyPut<TransactionController>(
      () => TransactionController(),
    );
    Get.lazyPut<TransactionProvider>(
      () => TransactionProvider(),
    );
  }
}
