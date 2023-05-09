import 'dart:convert';
/// id : 1
/// user : "Moaz"
/// items : [{"id":1,"product":{"id":2,"rating":null,"allergies":[{"id":2,"arabicName":"قمح","englishName":"wheat"}],"arabicName":"منتج 2","englishName":"product 2","arabicDescription":"منتج 2","englishDescription":"product 2","price":234,"image":"/media/1"},"quantity":5,"price":1170,"cart":1}]
/// total_price : 1170

GetCartDetailsModel getCartDetailsModelFromJson(String str) => GetCartDetailsModel.fromJson(json.decode(str));
String getCartDetailsModelToJson(GetCartDetailsModel data) => json.encode(data.toJson());
class GetCartDetailsModel {
  GetCartDetailsModel({
      num? id, 
      String? user, 
      List<Items>? items, 
      num? totalPrice,}){
    _id = id;
    _user = user;
    _items = items;
    _totalPrice = totalPrice;
}

  GetCartDetailsModel.fromJson(dynamic json) {
    _id = json['id'];
    _user = json['user'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    _totalPrice = json['total_price'];
  }
  num? _id;
  String? _user;
  List<Items>? _items;
  num? _totalPrice;
GetCartDetailsModel copyWith({  num? id,
  String? user,
  List<Items>? items,
  num? totalPrice,
}) => GetCartDetailsModel(  id: id ?? _id,
  user: user ?? _user,
  items: items ?? _items,
  totalPrice: totalPrice ?? _totalPrice,
);
  num get id => _id ?? 0;
  String get user => _user ?? '';
  List<Items> get items => _items ?? [];
  num get totalPrice => _totalPrice ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user'] = _user;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    map['total_price'] = _totalPrice;
    return map;
  }

}

/// id : 1
/// product : {"id":2,"rating":null,"allergies":[{"id":2,"arabicName":"قمح","englishName":"wheat"}],"arabicName":"منتج 2","englishName":"product 2","arabicDescription":"منتج 2","englishDescription":"product 2","price":234,"image":"/media/1"}
/// quantity : 5
/// price : 1170
/// cart : 1

Items itemsFromJson(String str) => Items.fromJson(json.decode(str));
String itemsToJson(Items data) => json.encode(data.toJson());
class Items {
  Items({
      num? id, 
      Product? product, 
      num? quantity, 
      num? price, 
      num? cart,}){
    _id = id;
    _product = product;
    _quantity = quantity;
    _price = price;
    _cart = cart;
}

  Items.fromJson(dynamic json) {
    _id = json['id'];
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
    _quantity = json['quantity'];
    _price = json['price'];
    _cart = json['cart'];
  }
  num? _id;
  Product? _product;
  num? _quantity;
  num? _price;
  num? _cart;
Items copyWith({  num? id,
  Product? product,
  num? quantity,
  num? price,
  num? cart,
}) => Items(  id: id ?? _id,
  product: product ?? _product,
  quantity: quantity ?? _quantity,
  price: price ?? _price,
  cart: cart ?? _cart,
);
  num get id => _id ?? 0;
  Product get product => _product ?? Product();
  num get quantity => _quantity ?? 0;
  num get price => _price ?? 0;
  num get cart => _cart ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['cart'] = _cart;
    return map;
  }

}

/// id : 2
/// rating : null
/// allergies : [{"id":2,"arabicName":"قمح","englishName":"wheat"}]
/// arabicName : "منتج 2"
/// englishName : "product 2"
/// arabicDescription : "منتج 2"
/// englishDescription : "product 2"
/// price : 234
/// image : "/media/1"

Product productFromJson(String str) => Product.fromJson(json.decode(str));
String productToJson(Product data) => json.encode(data.toJson());
class Product {
  Product({
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

  Product.fromJson(dynamic json) {
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
Product copyWith({  num? id,
  dynamic rating,
  List<Allergies>? allergies,
  String? arabicName,
  String? englishName,
  String? arabicDescription,
  String? englishDescription,
  num? price,
  String? image,
}) => Product(  id: id ?? _id,
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
  dynamic get rating => _rating ;
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

/// id : 2
/// arabicName : "قمح"
/// englishName : "wheat"

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
  num get id => _id ?? 0;
  String get arabicName => _arabicName ?? '';
  String get englishName => _englishName ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['arabicName'] = _arabicName;
    map['englishName'] = _englishName;
    return map;
  }

}