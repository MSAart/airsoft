import 'dart:io';

import 'package:airsoft/app/mixin/widgets/logger_widget.dart';
import 'package:airsoft/app/models/detailproduct_model.dart';
import 'package:airsoft/app/models/product_model.dart';
import 'package:get/get.dart';
import '../../../mixin/servers/erorhandling_server.dart';
import '../../../mixin/servers/interceptor_server.dart';

class ProductProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    allowAutoSignedCert = true;
    httpClient.baseUrl = 'https://openapi.mrstein.web.id';
    httpClient.timeout = const Duration(milliseconds: 40000);
    httpClient.addRequestModifier((request) {
      return requestInterceptor(request);
    });
  }

  // Menambahkan Product
  Future<Product> postProduct(
      String name, String desc, int price, File file) async {
    final request = FormData({
      "name": name,
      "description": desc,
      "price": price,
      "file": MultipartFile(
        file,
        filename: file.path.split("/").last,
      )
    });
    final response = await post('/airsoft/add', request);

    try {
      logger.i(response.body);
      return Product.fromJson(response.body);
    } catch (e, s) {
      logger.e('fetchProduct', e, s);
      if (response.hasError) {
        return Future.error(ErrorHandling(response));
      } else {
        return Future.error(ErrorHandling(e.toString()));
      }
    }
  }

  // Update Product
  Future<Product> updateProduct(int id, String name, String desc, int price,
      {File? file}) async {
    final request = (file == null)
        ? FormData({
            'id': id,
            "name": name,
            "description": desc,
            "price": price,
          })
        : FormData({
            'id': id,
            "name": name,
            "description": desc,
            "price": price,
            "file": MultipartFile(
              file,
              filename: file.path.split("/").last,
            )
          });
    final response = await post('/airsoft/update', request);

    try {
      logger.i(response.body);
      return Product.fromJson(response.body);
    } catch (e, s) {
      logger.e('fetchProduct', e, s);
      if (response.hasError) {
        return Future.error(ErrorHandling(response));
      } else {
        return Future.error(ErrorHandling(e.toString()));
      }
    }
  }

  // Mengambil Product
  Future<Product> getProduct(int page) async {
    final response = await get(
      '/airsoft',
      query: {
        'page': '$page',
      },
    );

    try {
      return Product.fromJson(response.body);
    } catch (e, s) {
      logger.e('fetchProduct', e, s);
      if (response.hasError) {
        return Future.error(ErrorHandling(response));
      } else {
        return Future.error(ErrorHandling(e.toString()));
      }
    }
  }

  // Menghapus Product
  Future<Product> deleteProduct(int id) async {
    final response = await delete(
      '/airsoft/delete/$id',
    );
    try {
      return Product.fromJson(response.body);
    } catch (e, s) {
      logger.e('deleteProduct', e, s);
      if (response.hasError) {
        return Future.error(ErrorHandling(response));
      } else {
        return Future.error(ErrorHandling(e.toString()));
      }
    }
  }

  // Detail Product
  Future<ProductDetail> detailProduct(int id) async {
    final response = await get(
      '/airsoft/$id',
    );
    try {
      logger.i(response.body);
      return ProductDetail.fromJson(response.body);
    } catch (e, s) {
      logger.e('deleteProduct', e, s);
      if (response.hasError) {
        return Future.error(ErrorHandling(response));
      } else {
        return Future.error(ErrorHandling(e.toString()));
      }
    }
  }
}
