import 'package:airsoft/app/mixin/widgets/dialog_widget.dart';
import 'package:airsoft/app/models/product_model.dart';
import 'package:airsoft/app/modules/home/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../mixin/constant/textstyle_constant.dart';

class HomeController extends GetxController {
  final productProvider = Get.find<ProductProvider>();
  RxList<Results> _listProduct = <Results>[].obs;
  int page = 1;

  // Get And Setter
  RxInt _currentIndex = 0.obs;
  RxInt get currentIndex => _currentIndex;
  RxList get listProduct => _listProduct;
  RxBool _isNoLoadMore = false.obs;
  bool get isNoLoadMore => _isNoLoadMore.value;
  RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  int getItemLength() {
    if (_isNoLoadMore.value == true) {
      return _listProduct.length;
    }
    return _listProduct.length + 1;
  }

  // Fungsi Mengambil data Product
  void fetchProduct({bool refresh = false}) {
    if (refresh == true) {
      _isNoLoadMore.value = false;
      page = 1;
      _listProduct.clear();
    }
    _isLoading.value = true;
    productProvider.getProduct(page).then((Product res) {
      _isLoading.value = false;
      if (res.data!.results!.isEmpty) {
        _isNoLoadMore.value = true;
      }
      if (res.data!.results!.isNotEmpty) {
        page++;
        _listProduct.addAll(res.data!.results!);
      }
    }).onError((error, stackTrace) {
      showSnackBar(error, onButtonClick: () {});
    });
  }

  void removeProduct(int id) {
    productProvider.deleteProduct(id);
    Get.snackbar("", "",
        titleText: Text(
          'Warning',
          style: Poppins12M.copyWith(
            color: Color(0xffB95000),
          ),
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        snackPosition: SnackPosition.BOTTOM,
        messageText: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.warning,
              color: Color(0xffB95000),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Has Been Removed from List',
              style: Poppins12L.copyWith(color: Color(0xffB95000)),
            ),
          ],
        ),
        backgroundColor: Color(0xfffff4ec));
  }

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
