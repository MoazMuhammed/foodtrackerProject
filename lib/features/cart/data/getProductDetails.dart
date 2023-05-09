import 'dart:convert';
/// id : 1
/// products : [{"id":1,"rating":null,"allergies":[{"id":1,"arabicName":"لبن","englishName":"milk"}],"arabicName":"منتج 1","englishName":"product 1","arabicDescription":"منتج 1","englishDescription":"product 1","price":280,"image":"/media/1"}]
/// arabicName : "لبن"
/// englishName : "milk"

GetProductDetails getProductDetailsFromJson(String str) => GetProductDetails.fromJson(json.decode(str));
String getProductDetailsToJson(GetProductDetails data) => json.encode(data.toJson());
class GetProductDetails {
  GetProductDetails({
      num? id, 
      List<Products>? products, 
      String? arabicName, 
      String? englishName,}){
    _id = id;
    _products = products;
    _arabicName = arabicName;
    _englishName = englishName;
}

  GetProductDetails.fromJson(dynamic json) {
    _id = json['id'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    _arabicName = json['arabicName'];
    _englishName = json['englishName'];
  }
  num? _id;
  List<Products>? _products;
  String? _arabicName;
  String? _englishName;
GetProductDetails copyWith({  num? id,
  List<Products>? products,
  String? arabicName,
  String? englishName,
}) => GetProductDetails(  id: id ?? _id,
  products: products ?? _products,
  arabicName: arabicName ?? _arabicName,
  englishName: englishName ?? _englishName,
);
  num? get id => _id;
  List<Products> get products => _products ?? [];
  String? get arabicName => _arabicName;
  String? get englishName => _englishName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['arabicName'] = _arabicName;
    map['englishName'] = _englishName;
    return map;
  }

}

/// id : 1
/// rating : null
/// allergies : [{"id":1,"arabicName":"لبن","englishName":"milk"}]
/// arabicName : "منتج 1"
/// englishName : "product 1"
/// arabicDescription : "منتج 1"
/// englishDescription : "product 1"
/// price : 280
/// image : "/media/1"

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
      num? id, 
      dynamic rating, 
      List<Allergies>? allergies, 
      String? arabicName, 
      String? englishName, 
      String? arabicDescription, 
      String? englishDescription, 
      num? price, 
      String? image,}){
    _id = id;
    _rating = rating;
    _allergies = allergies;
    _arabicName = arabicName;
    _englishName = englishName;
    _arabicDescription = arabicDescription;
    _englishDescription = englishDescription;
    _price = price;
    _image = image;
}

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _rating = json['rating'];
    if (json['allergies'] != null) {
      _allergies = [];
      json['allergies'].forEach((v) {
        _allergies?.add(Allergies.fromJson(v));
      });
    }
    _arabicName = json['arabicName'];
    _englishName = json['englishName'];
    _arabicDescription = json['arabicDescription'];
    _englishDescription = json['englishDescription'];
    _price = json['price'];
    _image = json['image'];
  }
  num? _id;
  dynamic _rating;
  List<Allergies>? _allergies;
  String? _arabicName;
  String? _englishName;
  String? _arabicDescription;
  String? _englishDescription;
  num? _price;
  String? _image;
Products copyWith({  num? id,
  dynamic rating,
  List<Allergies>? allergies,
  String? arabicName,
  String? englishName,
  String? arabicDescription,
  String? englishDescription,
  num? price,
  String? image,
}) => Products(  id: id ?? _id,
  rating: rating ?? _rating,
  allergies: allergies ?? _allergies,
  arabicName: arabicName ?? _arabicName,
  englishName: englishName ?? _englishName,
  arabicDescription: arabicDescription ?? _arabicDescription,
  englishDescription: englishDescription ?? _englishDescription,
  price: price ?? _price,
  image: image ?? _image,
);
  num get id => _id ?? 0;
  dynamic get rating => _rating;
  List<Allergies> get allergies => _allergies ?? [];
  String get arabicName => _arabicName ?? '';
  String get englishName => _englishName ?? '';
  String get arabicDescription => _arabicDescription ?? '';
  String get englishDescription => _englishDescription ?? '';
  num get price => _price ?? 0;
  String get image => _image ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['rating'] = _rating;
    if (_allergies != null) {
      map['allergies'] = _allergies?.map((v) => v.toJson()).toList();
    }
    map['arabicName'] = _arabicName;
    map['englishName'] = _englishName;
    map['arabicDescription'] = _arabicDescription;
    map['englishDescription'] = _englishDescription;
    map['price'] = _price;
    map['image'] = _image;
    return map;
  }

}

/// id : 1
/// arabicName : "لبن"
/// englishName : "milk"

Allergies allergiesFromJson(String str) => Allergies.fromJson(json.decode(str));
String allergiesToJson(Allergies data) => json.encode(data.toJson());
class Allergies {
  Allergies({
      num? id, 
      String? arabicName, 
      String? englishName,}){
    _id = id;
    _arabicName = arabicName;
    _englishName = englishName;
}

  Allergies.fromJson(dynamic json) {
    _id = json['id'];
    _arabicName = json['arabicName'];
    _englishName = json['englishName'];
  }
  num? _id;
  String? _arabicName;
  String? _englishName;
Allergies copyWith({  num? id,
  String? arabicName,
  String? englishName,
}) => Allergies(  id: id ?? _id,
  arabicName: arabicName ?? _arabicName,
  englishName: englishName ?? _englishName,
);
  num? get id => _id;
  String? get arabicName => _arabicName;
  String? get englishName => _englishName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['arabicName'] = _arabicName;
    map['englishName'] = _englishName;
    return map;
  }

}