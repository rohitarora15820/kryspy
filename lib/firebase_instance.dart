import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseInstances{
  static FirebaseAuth? firebaseAuthInstance=FirebaseAuth.instance;
  static FirebaseFirestore? firebaseFirestore=FirebaseFirestore.instance;
  static FirebaseStorage? firebaseStorage=FirebaseStorage.instance;
}