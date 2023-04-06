import 'dart:convert';
/// Token : "33f4e1ab9ad935bd23f7b1be475f0d57fcb2865d"

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));
String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());
class SignUpModel {
  SignUpModel({
      String? token,}){
    _token = token;
}

  SignUpModel.fromJson(dynamic json) {
    _token = json['Token'];
  }
  String? _token;
SignUpModel copyWith({  String? token,
}) => SignUpModel(  token: token ?? _token,
);
  String get token => _token ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Token'] = _token;
    return map;
  }

}