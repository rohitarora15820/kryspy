// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

// String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
    String category;
    String name;
    int price;
    int ratings;
    String description;
    String image;

    ItemModel({
        required this.category,
        required this.name,
        required this.price,
        required this.ratings,
        required this.description,
        required this.image,
    });

    factory ItemModel.fromFirestore(DocumentSnapshot doc) { 
     final json= doc.data() as Map<String, dynamic>;
      
      return
      ItemModel(
        category: json["category"]??'',
        name: json["name"]??'',
        price: json["price"]??'',
        ratings: json["rating"]??'',
        description: json["description"]??"",
        image: json["image"]??'',
    );
    }

    Map<String, dynamic> toJson() => {
        "category": category,
        "name": name,
        "price": price,
        "raings": ratings,
        "description": description,
        "image": image,
    };
}
