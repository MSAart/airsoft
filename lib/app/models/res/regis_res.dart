import 'package:airsoft/app/models/user_model.dart';

class RegisRes {
  bool? success;
  UserModel? data;
  String? message;

  RegisRes({this.success, this.data, this.message});

  RegisRes.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new UserModel.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}
