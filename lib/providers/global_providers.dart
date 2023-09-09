import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kryspy/model/item_model.dart';
import '../services/categories.dart';
import 'auth_provider.dart';
import 'data_provider.dart';


final dataProvider = Provider((ref) => DataProvider());

final authProviders = Provider((ref) => AuthProviders());



final firebaseFirestoreProvider=Provider((ref) => FirebaseFirestore.instance);
final firebaseAuthProvider=Provider((ref) => FirebaseAuth.instance);
final firebaseFireStorageProvider=Provider((ref) => FirebaseStorage.instance);

final itemListProvider=StreamProvider<List<ItemModel>>((ref) => ref.read(dataProvider).itemStream);

final checkUserLoggedIn=StreamProvider((ref) => ref.read(authProviders).checkWhetherUserLoggedIn);

