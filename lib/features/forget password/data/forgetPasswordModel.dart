import 'dart:convert';
/// status : true
/// message : "We have sent you a link to reset your password"

ForgetPasswordModel forgetPasswordModelFromJson(String str) => ForgetPasswordModel.fromJson(json.decode(str));
String forgetPasswordModelToJson(ForgetPasswordModel data) => json.encode(data.toJson());
class ForgetPasswordModel {
  ForgetPasswordModel({
      bool? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  ForgetPasswordModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  bool? _status;
  String? _message;
ForgetPasswordModel copyWith({  bool? status,
  String? message,
}) => ForgetPasswordModel(  status: status ?? _status,
  message: message ?? _message,
);
  bool get status => _status ?? false;
  String get message => _message ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}