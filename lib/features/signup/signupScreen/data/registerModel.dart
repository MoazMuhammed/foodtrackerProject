import 'dart:convert';
/// status : true
/// message : "لقد تم انشاء ايميل وارسلنا رسالة تفعيل للايميل الخاص بك"

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));
String registerModelToJson(RegisterModel data) => json.encode(data.toJson());
class RegisterModel {
  RegisterModel({
      bool? status, 
      String? message,}){
    _status = status;
    _message = message;
}


  RegisterModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  bool? _status;
  String? _message;
RegisterModel copyWith({  bool? status,
  String? message,
}) => RegisterModel(  status: status ?? _status,
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