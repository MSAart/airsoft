import 'package:airsoft/app/mixin/widgets/logger_widget.dart';
import 'package:airsoft/app/models/res/detailtransaction_model.dart';
import 'package:airsoft/app/models/res/transactionget_model.dart';
import 'package:get/get.dart';
import '../../../mixin/servers/erorhandling_server.dart';
import '../../../mixin/servers/interceptor_server.dart';

class TransactionProvider extends GetConnect {
  late Detail detail;

  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = 'https://openapi.mrstein.web.id';
    httpClient.timeout = const Duration(milliseconds: 40000);
    httpClient.addRequestModifier((request) {
      return requestInterceptor(request);
    });
  }

  // Mengambil Transaction
  Future<TransactionGet> getTransaction(int page) async {
    final response = await get(
      '/transaction',
      query: {
        'page': '$page',
      },
    );
    try {
      logger.i(response.body);
      return TransactionGet.fromJson(response.body);
    } catch (e, s) {
      logger.e('fetchTransaction', e, s);
      if (response.hasError) {
        return Future.error(ErrorHandling(response));
      } else {
        return Future.error(ErrorHandling(e.toString()));
      }
    }
  }

  // Menambahkan Transaksi
  Future<TransactionGet> postTransaction(List items) async {
    final request = {'items': items};
    final response = await post('/transaction', request);
    try {
      logger.i(response.body);
      return TransactionGet.fromJson(response.body);
    } catch (e) {
      if (response.hasError) {
        return Future.error(ErrorHandling(response));
      } else {
        return Future.error(ErrorHandling(e.toString()));
      }
    }
  }

  Future<DetailTransaction> getDetailTransaction(int id) async {
    final response = await get('/transaction/$id');
    try {
      logger.i(response.body);
      return DetailTransaction.fromJson(response.body);
    } catch (e, s) {
      logger.e('error', e, s);
      if (response.hasError) {
        return Future.error(ErrorHandling(response));
      } else {
        return Future.error(ErrorHandling(e.toString()));
      }
    }
  }
}
