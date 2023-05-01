import 'dart:convert';
/// id : 0
/// allergy_pic : "string"
/// arabicDescription : "string"
/// englishDescription : "string"
/// arabicName : "string"
/// englishName : "string"
/// arabicSymptoms : "string"
/// englishSymptoms : "string"
/// arabicProtection : "string"
/// englishProtection : "string"

CategoryDetailsModel categoryDetailsModelFromJson(String str) => CategoryDetailsModel.fromJson(json.decode(str));
String categoryDetailsModelToJson(CategoryDetailsModel data) => json.encode(data.toJson());
class CategoryDetailsModel {
  CategoryDetailsModel({
      num? id, 
      String? allergyPic, 
      String? arabicDescription, 
      String? englishDescription, 
      String? arabicName, 
      String? englishName, 
      String? arabicSymptoms, 
      String? englishSymptoms, 
      String? arabicProtection, 
      String? englishProtection,}){
    _id = id;
    _allergyPic = allergyPic;
    _arabicDescription = arabicDescription;
    _englishDescription = englishDescription;
    _arabicName = arabicName;
    _englishName = englishName;
    _arabicSymptoms = arabicSymptoms;
    _englishSymptoms = englishSymptoms;
    _arabicProtection = arabicProtection;
    _englishProtection = englishProtection;
}

  CategoryDetailsModel.fromJson(dynamic json) {
    _id = json['id'];
    _allergyPic = json['allergy_pic'];
    _arabicDescription = json['arabicDescription'];
    _englishDescription = json['englishDescription'];
    _arabicName = json['arabicName'];
    _englishName = json['englishName'];
    _arabicSymptoms = json['arabicSymptoms'];
    _englishSymptoms = json['englishSymptoms'];
    _arabicProtection = json['arabicProtection'];
    _englishProtection = json['englishProtection'];
  }
  num? _id;
  String? _allergyPic;
  String? _arabicDescription;
  String? _englishDescription;
  String? _arabicName;
  String? _englishName;
  String? _arabicSymptoms;
  String? _englishSymptoms;
  String? _arabicProtection;
  String? _englishProtection;
CategoryDetailsModel copyWith({  num? id,
  String? allergyPic,
  String? arabicDescription,
  String? englishDescription,
  String? arabicName,
  String? englishName,
  String? arabicSymptoms,
  String? englishSymptoms,
  String? arabicProtection,
  String? englishProtection,
}) => CategoryDetailsModel(  id: id ?? _id,
  allergyPic: allergyPic ?? _allergyPic,
  arabicDescription: arabicDescription ?? _arabicDescription,
  englishDescription: englishDescription ?? _englishDescription,
  arabicName: arabicName ?? _arabicName,
  englishName: englishName ?? _englishName,
  arabicSymptoms: arabicSymptoms ?? _arabicSymptoms,
  englishSymptoms: englishSymptoms ?? _englishSymptoms,
  arabicProtection: arabicProtection ?? _arabicProtection,
  englishProtection: englishProtection ?? _englishProtection,
);
  num get id => _id ?? 0;
  String get allergyPic => _allergyPic ?? '';
  String get arabicDescription => _arabicDescription ?? 'a7a';
  String get englishDescription => _englishDescription ?? '';
  String get arabicName => _arabicName ?? '';
  String get englishName => _englishName ?? '';
  String get arabicSymptoms => _arabicSymptoms ?? '';
  String get englishSymptoms => _englishSymptoms ?? '';
  String get arabicProtection => _arabicProtection ?? '';
  String get englishProtection => _englishProtection ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['allergy_pic'] = _allergyPic;
    map['arabicDescription'] = _arabicDescription;
    map['englishDescription'] = _englishDescription;
    map['arabicName'] = _arabicName;
    map['englishName'] = _englishName;
    map['arabicSymptoms'] = _arabicSymptoms;
    map['englishSymptoms'] = _englishSymptoms;
    map['arabicProtection'] = _arabicProtection;
    map['englishProtection'] = _englishProtection;
    return map;
  }

}