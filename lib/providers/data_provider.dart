import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kryspy/firebase_instance.dart';
import 'package:kryspy/model/item_model.dart';

class DataProvider {
  Stream<List<ItemModel>> get itemStream => FirebaseInstances.firebaseFirestore!
      .collection("items")
      .snapshots()
      .map((event) =>
          event.docs.map((e) => ItemModel.fromFirestore(e)).toList());



   
  Future writeItems(
    BuildContext? context,
      {String? name,
      String? category,
      String? description,
      int? rating,
      int? price,
      String? image
      }) async {
    try {
      EasyLoading.show(
          indicator: const CircularProgressIndicator(), status: "Loading...");
      var data = {
        "name": name,
        "category": category,
        "description": description,
        "rating": rating,
        "price": price,
        "image": image  
      };
      FirebaseInstances.firebaseFirestore!.collection("items").add(data);
      GoRouter.of(context!).pop();
      EasyLoading.showToast("Product Added Successfully!");
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showError(e.toString());
      EasyLoading.dismiss();
    }
  }
}


