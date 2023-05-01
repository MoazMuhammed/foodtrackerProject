import 'dart:convert';
/// id : 0
/// mini_allergy_pic : "string"
/// arabicName : "string"
/// englishName : "string"

GetAllergyModel getAllergyModelFromJson(String str) => GetAllergyModel.fromJson(json.decode(str));
String getAllergyModelToJson(GetAllergyModel data) => json.encode(data.toJson());
class GetAllergyModel {
  GetAllergyModel({
      num? id, 
      String? miniAllergyPic, 
      String? arabicName, 
      String? englishName,}){
    _id = id;
    _miniAllergyPic = miniAllergyPic;
    _arabicName = arabicName;
    _englishName = englishName;
}

  GetAllergyModel.fromJson(dynamic json) {
    _id = json['id'];
    _miniAllergyPic = json['mini_allergy_pic'];
    _arabicName = json['arabicName'];
    _englishName = json['englishName'];
  }
  num? _id;
  String? _miniAllergyPic;
  String? _arabicName;
  String? _englishName;
GetAllergyModel copyWith({  num? id,
  String? miniAllergyPic,
  String? arabicName,
  String? englishName,
}) => GetAllergyModel(  id: id ?? _id,
  miniAllergyPic: miniAllergyPic ?? _miniAllergyPic,
  arabicName: arabicName ?? _arabicName,
  englishName: englishName ?? _englishName,
);
  num get id => _id ?? 0;
  String get miniAllergyPic => _miniAllergyPic ?? '';
  String get arabicName => _arabicName ?? '';
  String get englishName => _englishName ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['mini_allergy_pic'] = _miniAllergyPic;
    map['arabicName'] = _arabicName;
    map['englishName'] = _englishName;
    return map;
  }

}