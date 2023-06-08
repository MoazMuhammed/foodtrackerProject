import 'dart:convert';
/// id : 1
/// rating : 1
/// allergies : [{"id":1,"arabicName":"لبن","englishName":"milk"}]
/// arabicName : "منتج 1"
/// englishName : "product 1"
/// arabicDescription : "منتج 1"
/// englishDescription : "product 1"
/// price : 280
/// image : "http://127.0.0.1:8000/media/1"

PushRating pushRatingFromJson(String str) => PushRating.fromJson(json.decode(str));
String pushRatingToJson(PushRating data) => json.encode(data.toJson());
class PushRating {
  PushRating({
      num? id, 
      num? rating, 
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

  PushRating.fromJson(dynamic json) {
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
  num? _rating;
  List<Allergies>? _allergies;
  String? _arabicName;
  String? _englishName;
  String? _arabicDescription;
  String? _englishDescription;
  num? _price;
  String? _image;
PushRating copyWith({  num? id,
  num? rating,
  List<Allergies>? allergies,
  String? arabicName,
  String? englishName,
  String? arabicDescription,
  String? englishDescription,
  num? price,
  String? image,
}) => PushRating(  id: id ?? _id,
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
  num get rating => _rating ?? 0;
  List<Allergies>? get allergies => _allergies;
  String? get arabicName => _arabicName ?? '';
  String? get englishName => _englishName ?? '';
  String? get arabicDescription => _arabicDescription ?? '';
  String? get englishDescription => _englishDescription ?? '';
  num? get price => _price ?? 0;
  String? get image => _image ?? '';

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