import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kryspy/providers/auth_provider.dart';

import '../../components/customTextField.dart';
import '../../firebase_instance.dart';
import '../../providers/global_providers.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Sign Up"),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 120, 8, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //  const SizedBox(
              //   height: 25,
              // ),

              Image.network(
                "https://firebase.google.com/static/images/brand-guidelines/logo-built_black.png",
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 25,
              ),

              CustomTextField(
                userNameController: _userNameController,
                hintText: "Enter Email",
                obscureText: false,
              ),
              const SizedBox(
                height: 10,
              ),

              CustomTextField(
                obscureText: true,
                userNameController: _passwordController,
                hintText: "Enter Password",
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await ref.read(authProviders).signUpWithEmailAndPassword(
                        _userNameController.text.trim(),
                        _passwordController.text.trim(),context);
                  },
                  child: const Text("Sign Up")),
             
            ],
          ),
        ),
      ),
    );
  }
}
