import 'dart:convert';
/// category_name : "Meat"
/// food_name : "Burger"
/// allergies : "This meal may cause a Meat Allergy "

PredictModel predictModelFromJson(String str) => PredictModel.fromJson(json.decode(str));
String predictModelToJson(PredictModel data) => json.encode(data.toJson());
class PredictModel {
  PredictModel({
      String? categoryName, 
      String? foodName, 
      String? allergies,}){
    _categoryName = categoryName;
    _foodName = foodName;
    _allergies = allergies;
}

  PredictModel.fromJson(dynamic json) {
    _categoryName = json['category_name'];
    _foodName = json['food_name'];
    _allergies = json['allergies'];
  }
  String? _categoryName;
  String? _foodName;
  String? _allergies;
PredictModel copyWith({  String? categoryName,
  String? foodName,
  String? allergies,
}) => PredictModel(  categoryName: categoryName ?? _categoryName,
  foodName: foodName ?? _foodName,
  allergies: allergies ?? _allergies,
);
  String get categoryName => _categoryName ?? '';
  String get foodName => _foodName ?? '';
  String get allergies => _allergies ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_name'] = _categoryName;
    map['food_name'] = _foodName;
    map['allergies'] = _allergies;
    return map;
  }

}