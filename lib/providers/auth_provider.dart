import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:kryspy/firebase_instance.dart';


class AuthProviders {


  Future signUpWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      EasyLoading.show(
          indicator: const CircularProgressIndicator(), status: "Loading...");
      await FirebaseInstances.firebaseAuthInstance!
          .createUserWithEmailAndPassword(email: email, password: password);
       GoRouter.of(context)
          .pushNamed('dashboard');
      EasyLoading.showToast("User Registration Success");
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showError(e.toString());
      EasyLoading.dismiss();
    }
  }

  Future signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      EasyLoading.show(
          indicator: const CircularProgressIndicator(), status: "Loading...");
      await FirebaseInstances.firebaseAuthInstance!
          .signInWithEmailAndPassword(email: email, password: password);
    
        
      GoRouter.of(context)
          .pushNamed('dashboard');
      EasyLoading.showToast("User Registration Success");
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showError(e.toString());
      EasyLoading.dismiss();
    }
  }

  Future logoutFromFirebase(BuildContext context) async {
    try {
      EasyLoading.show(
          indicator: const CircularProgressIndicator(), status: "Loading...");
      await FirebaseInstances.firebaseAuthInstance!.signOut();

      // ignore: use_build_context_synchronously
      GoRouter.of(context)
          .pushReplacement('/');
      EasyLoading.showToast("Logout Successfully");
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.showError(e.toString());
      EasyLoading.dismiss();
    }
  }

Stream get checkWhetherUserLoggedIn => FirebaseInstances.firebaseAuthInstance!.authStateChanges(); 
}


