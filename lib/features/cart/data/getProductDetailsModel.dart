import 'dart:convert';
/// id : 0
/// arabicName : "string"
/// englishName : "string"
/// arabicDescription : "string"
/// englishDescription : "string"
/// price : "-0"
/// image : "string"
/// ratings : [0]
/// allergies : [0]

GetProductDetailsModel getProductDetailsModelFromJson(String str) => GetProductDetailsModel.fromJson(json.decode(str));
String getProductDetailsModelToJson(GetProductDetailsModel data) => json.encode(data.toJson());
class GetProductDetailsModel {
  GetProductDetailsModel({
      num? id, 
      String? arabicName, 
      String? englishName, 
      String? arabicDescription, 
      String? englishDescription, 
      String? price, 
      String? image, 
      List<num>? ratings, 
      List<num>? allergies,}){
    _id = id;
    _arabicName = arabicName;
    _englishName = englishName;
    _arabicDescription = arabicDescription;
    _englishDescription = englishDescription;
    _price = price;
    _image = image;
    _ratings = ratings;
    _allergies = allergies;
}

  GetProductDetailsModel.fromJson(dynamic json) {
    _id = json['id'];
    _arabicName = json['arabicName'];
    _englishName = json['englishName'];
    _arabicDescription = json['arabicDescription'];
    _englishDescription = json['englishDescription'];
    _price = json['price'];
    _image = json['image'];
    _ratings = json['ratings'] != null ? json['ratings'].cast<num>() : [];
    _allergies = json['allergies'] != null ? json['allergies'].cast<num>() : [];
  }
  num? _id;
  String? _arabicName;
  String? _englishName;
  String? _arabicDescription;
  String? _englishDescription;
  String? _price;
  String? _image;
  List<num>? _ratings;
  List<num>? _allergies;
GetProductDetailsModel copyWith({  num? id,
  String? arabicName,
  String? englishName,
  String? arabicDescription,
  String? englishDescription,
  String? price,
  String? image,
  List<num>? ratings,
  List<num>? allergies,
}) => GetProductDetailsModel(  id: id ?? _id,
  arabicName: arabicName ?? _arabicName,
  englishName: englishName ?? _englishName,
  arabicDescription: arabicDescription ?? _arabicDescription,
  englishDescription: englishDescription ?? _englishDescription,
  price: price ?? _price,
  image: image ?? _image,
  ratings: ratings ?? _ratings,
  allergies: allergies ?? _allergies,
);
  num get id => _id ?? 0;
  String get arabicName => _arabicName ?? '';
  String get englishName => _englishName ?? '';
  String get arabicDescription => _arabicDescription ?? '';
  String get englishDescription => _englishDescription ?? '';
  String get price => _price ?? '';
  String get image => _image ?? '';
  List<num> get ratings => _ratings ?? [];
  List<num> get allergies => _allergies ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['arabicName'] = _arabicName;
    map['englishName'] = _englishName;
    map['arabicDescription'] = _arabicDescription;
    map['englishDescription'] = _englishDescription;
    map['price'] = _price;
    map['image'] = _image;
    map['ratings'] = _ratings;
    map['allergies'] = _allergies;
    return map;
  }

}