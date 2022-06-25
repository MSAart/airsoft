import 'package:airsoft/app/modules/transaction/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../mixin/constant/textstyle_constant.dart';
import '../../../mixin/widgets/dialog_widget.dart';
import '../../../models/res/transactionget_model.dart';

class TransactionController extends GetxController {
  final transactionProvider = Get.find<TransactionProvider>();
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

  int getItemLength() {
    if (_isNoLoadMore.value == true) {
      return _listTransaction.length;
    }
    return _listTransaction.length + 1;
  }

  // Fungsi Mengambil data Product
  void fetchTransaction({bool refresh = false}) {
    if (refresh == true) {
      _isNoLoadMore.value = false;
      page = 1;
      _listTransaction.clear();
    }
    _isLoading.value = true;
    transactionProvider.getTransaction(page).then((TransactionGet res) {
      _isLoading.value = false;
      if (res.data!.results!.isEmpty) {
        _isNoLoadMore.value = true;
      }
      if (res.data!.results!.isNotEmpty) {
        page++;
        _listTransaction.addAll(res.data!.results!);
      }
    }).onError((error, stackTrace) {
      showSnackBar(error, onButtonClick: () {});
    });
  }

  // Fungsi Menambahkan items to Cart
  void addToCart(List items) async {
    transactionProvider.postTransaction(items);
    await Get.snackbar("", "",
        titleText: Text(
          'Success ',
          style: Poppins12M.copyWith(
            color: Color(0xff287d3c),
          ),
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        snackPosition: SnackPosition.TOP,
        messageText: Row(
          // mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.check_circle,
              color: Color(0xff287d3c),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Has been added to my cart ',
              style: Poppins12L.copyWith(color: Color(0xff287d3c)),
            ),
          ],
        ),
        backgroundColor: Color(0xffedf9f0));
  }

  @override
  void onInit() async {
    fetchTransaction();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  void decrement() => count.value--;
}
