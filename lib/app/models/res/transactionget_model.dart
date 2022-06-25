class TransactionGet {
  bool? success;
  String? message;
  DataGet? data;

  TransactionGet({this.success, this.message, this.data});

  TransactionGet.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new DataGet.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataGet {
  int? total;
  List<ResultsGet>? results;

  DataGet({this.total, this.results});

  DataGet.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['results'] != null) {
      results = <ResultsGet>[];
      json['results'].forEach((v) {
        results!.add(new ResultsGet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultsGet {
  int? id;
  String? transCode;
  String? date;

  ResultsGet({this.id, this.transCode, this.date});

  ResultsGet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transCode = json['trans_code'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trans_code'] = this.transCode;
    data['date'] = this.date;
    return data;
  }
}
