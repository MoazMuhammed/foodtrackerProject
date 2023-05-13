import 'dart:convert';
/// image : "string"
/// category : {"id":0,"food":"string","allegry":"string","arabicName":"string","englishName":"string","allergy":[0]}

PredictModel predictModelFromJson(String str) => PredictModel.fromJson(json.decode(str));
String predictModelToJson(PredictModel data) => json.encode(data.toJson());
class PredictModel {
  PredictModel({
      String? image, 
      Category? category,}){
    _image = image;
    _category = category;
}

  PredictModel.fromJson(dynamic json) {
    _image = json['image'];
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }
  String? _image;
  Category? _category;
PredictModel copyWith({  String? image,
  Category? category,
}) => PredictModel(  image: image ?? _image,
  category: category ?? _category,
);
  String get image => _image ?? '';
  Category get category => _category ?? Category();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    return map;
  }

}

/// id : 0
/// food : "string"
/// allegry : "string"
/// arabicName : "string"
/// englishName : "string"
/// allergy : [0]

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));
String categoryToJson(Category data) => json.encode(data.toJson());
class Category {
  Category({
      num? id, 
      String? food, 
      String? allegry, 
      String? arabicName, 
      String? englishName, 
      List<num>? allergy,}){
    _id = id;
    _food = food;
    _allegry = allegry;
    _arabicName = arabicName;
    _englishName = englishName;
    _allergy = allergy;
}

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _food = json['food'];
    _allegry = json['allegry'];
    _arabicName = json['arabicName'];
    _englishName = json['englishName'];
    _allergy = json['allergy'] != null ? json['allergy'].cast<num>() : [];
  }
  num? _id;
  String? _food;
  String? _allegry;
  String? _arabicName;
  String? _englishName;
  List<num>? _allergy;
Category copyWith({  num? id,
  String? food,
  String? allegry,
  String? arabicName,
  String? englishName,
  List<num>? allergy,
}) => Category(  id: id ?? _id,
  food: food ?? _food,
  allegry: allegry ?? _allegry,
  arabicName: arabicName ?? _arabicName,
  englishName: englishName ?? _englishName,
  allergy: allergy ?? _allergy,
);
  num get id => _id ?? 0;
  String get food => _food ?? '';
  String get allegry => _allegry ?? '';
  String get arabicName => _arabicName ?? '';
  String get englishName => _englishName ?? '';
  List<num> get allergy => _allergy ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['food'] = _food;
    map['allegry'] = _allegry;
    map['arabicName'] = _arabicName;
    map['englishName'] = _englishName;
    map['allergy'] = _allergy;
    return map;
  }

}