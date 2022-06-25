import 'package:airsoft/app/mixin/widgets/dialog_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';

import '../widgets/logger_widget.dart';

requestInterceptor(Request request) {
  var message = {
    'REQUEST URL:': request.url,
    'REQUEST HEADER:': request.headers,
    'REQUEST METHOD:': request.method,
    'REQUEST BODY': request.bodyBytes
  };
  request.headers['accept'] = 'application/json';
  logger.i(message);

  if (GetStorage().hasData('auth')) {
    final box = GetStorage().read('auth');
    request.headers["authorization"] = "Bearer ${box['token']}";
  }
  return request;
}

responseInterceptor(Request request, Response response) {
  var message = <String, dynamic>{
    'RESPONSE URL:': request.url,
    'RESPONSE CODE:': response.statusCode,
    'RESPONSE MESSAGE:': response.statusText,
    'RESPONSE BODY:': response.body,
    'RESPONSE UNAUTHORIZED:': response.unauthorized,
  };
  logger.i(message);
  showSnackBar(response.body['message'], onButtonClick: () {});
  GetStorage().write(request.url.toString(), response.body);
  print("");
  return response;
}
