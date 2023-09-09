import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kryspy/constants/firebaseConstants.dart';
import 'package:kryspy/model/category_model.dart';
import 'package:kryspy/providers/global_providers.dart';

final categoryServiceProvider = Provider(
    (ref) => CategoryServices(firestore: ref.watch(firebaseFirestoreProvider)));

class CategoryServices {
  final FirebaseFirestore _firestore;

  CategoryServices({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _categories =>
      _firestore.collection(FirebaseConstants.categories);

  Stream<List<CategoryModel>> getcategories() {
    return _categories.snapshots().map((event) {
      List<CategoryModel> categoryList = [];
      for (var i in event.docs) {
        categoryList
            .add(CategoryModel.fromMap(i.data() as Map<String, dynamic>));
      }
      return categoryList;
    });
  }
}
