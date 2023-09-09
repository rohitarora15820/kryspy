import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kryspy/constants/firebaseConstants.dart';
import 'package:kryspy/model/product_model.dart';
import 'package:kryspy/providers/global_providers.dart';

final productServiceProvider = Provider(
    (ref) => ProductService(firestore: ref.watch(firebaseFirestoreProvider)));

class ProductService {
  final FirebaseFirestore _firebaseFirestore;

  ProductService({required FirebaseFirestore firestore})
      : _firebaseFirestore = firestore,
        super();

  CollectionReference get _products =>
      _firebaseFirestore.collection(FirebaseConstants.products);

  Stream<List<ProductModel>> getProducts() {
    return _products.snapshots().map((event) {
      List<ProductModel> productData = [];
      for (var i in event.docs) {
        productData.add(ProductModel.fromMap(i.data() as Map<String, dynamic>));
      }
      return productData;
    });
  }

  Stream<ProductModel> getProductById(String productId) {
    return _products
        .doc(productId)
        .snapshots()
        .map((event) => ProductModel.fromMap(event as Map<String, dynamic>));
  }
}
