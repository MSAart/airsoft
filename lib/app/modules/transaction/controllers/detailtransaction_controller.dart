import 'package:airsoft/app/mixin/widgets/logger_widget.dart';
import 'package:get/get.dart';
import '../../../models/res/detailtransaction_model.dart';
import '../../../models/res/transactionget_model.dart';
import '../../../routes/app_pages.dart';
import '../providers/transaction_provider.dart';

class DetailtransactionController extends GetxController {
  final transactionProvider = Get.find<TransactionProvider>();
  Rx<Detail>? detail = Rx(Detail());
  RxList<ResultsGet> _listTransaction = <ResultsGet>[].obs;
  final count = 0.obs;

  int page = 1;

  // Get And Setter
  RxInt _currentIndex = 0.obs;
  RxInt get currentIndex => _currentIndex;
  RxList get listTransaction => _listTransaction;
  RxBool _isNoLoadMore = false.obs;
  bool get isNoLoadMore => _isNoLoadMore.value;
  RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  void detailTransaction(int id) {
    transactionProvider.getDetailTransaction(id).then((value) {
      logger.i(value.data!.detail!.map((e) => detail!.value = e));
      value.data!.detail!.map((e) {
        detail!.value = e;
      });
      Get.toNamed(Routes.DETAILTRANSACTION);
    });
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
  void increment() => count.value++;
}
