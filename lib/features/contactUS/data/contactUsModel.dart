import 'dart:convert';
/// message : "Thank you for your message! We will get back to you soon."

ContactUsModel contactUsModelFromJson(String str) => ContactUsModel.fromJson(json.decode(str));
String contactUsModelToJson(ContactUsModel data) => json.encode(data.toJson());
class ContactUsModel {
  ContactUsModel({
      String? message,}){
    _message = message;
}

  ContactUsModel.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;
ContactUsModel copyWith({  String? message,
}) => ContactUsModel(  message: message ?? _message,
);
  String get message => _message ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}