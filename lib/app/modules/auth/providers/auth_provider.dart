import 'package:airsoft/app/models/res/regis_res.dart';
import 'package:get/get.dart';
import '../../../mixin/servers/interceptor_server.dart';

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    allowAutoSignedCert = true;
    httpClient.baseUrl = 'https://openapi.mrstein.web.id';
    httpClient.timeout = const Duration(milliseconds: 40000);
    httpClient.addRequestModifier((request) {
      return requestInterceptor(request);
    });
    httpClient.addResponseModifier((request, response) {
      return responseInterceptor(
        request,
        response,
      );
    });
  }

  Future<RegisRes> getData(String email, String password) async {
    try {
      final request = {
        "email": email,
        "password": password,
      };
      final respone = await post('/auth/login/', request);
      return RegisRes.fromJson(respone.body);
    } catch (er) {
      return throw Exception();
    }
  }

  Future<RegisRes> postData(String name, String email, String password) async {
    try {
      final request = {
        "name": name,
        "email": email,
        "password": password,
      };
      final response = await post('/auth/register/', request);

      print(request);
      return RegisRes.fromJson(response.body);
    } catch (er) {
      return throw Exception();
    }
  }
}
