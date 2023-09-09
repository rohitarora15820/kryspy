import 'dart:convert';

class ProductModel {
  String? productId;
  String? name;
  String? image;
  double? price;
  double? oldPrice;
  bool? isAvailable;
  String? description;
  String? categoryName;
  ProductModel({
    this.productId,
    this.name,
    this.image,
    this.price,
    this.oldPrice,
    this.isAvailable,
    this.description,
    this.categoryName,
  });



  ProductModel copyWith({
    String? productId,
    String? name,
    String? image,
    double? price,
    double? oldPrice,
    bool? isAvailable,
    String? description,
    String? categoryName,
  }) {
    return ProductModel(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      isAvailable: isAvailable ?? this.isAvailable,
      description: description ?? this.description,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': name,
      'image': image,
      'price': price,
      'oldPrice': oldPrice,
      'isAvailable': isAvailable,
      'description': description,
      'categoryName': categoryName,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productId: map['productId'],
      name: map['name'],
      image: map['image'],
      price: map['price']?.toDouble(),
      oldPrice: map['oldPrice']?.toDouble(),
      isAvailable: map['isAvailable'],
      description: map['description'],
      categoryName: map['categoryName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(productId: $productId, name: $name, image: $image, price: $price, oldPrice: $oldPrice, isAvailable: $isAvailable, description: $description, categoryName: $categoryName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ProductModel &&
      other.productId == productId &&
      other.name == name &&
      other.image == image &&
      other.price == price &&
      other.oldPrice == oldPrice &&
      other.isAvailable == isAvailable &&
      other.description == description &&
      other.categoryName == categoryName;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
      name.hashCode ^
      image.hashCode ^
      price.hashCode ^
      oldPrice.hashCode ^
      isAvailable.hashCode ^
      description.hashCode ^
      categoryName.hashCode;
  }
}
