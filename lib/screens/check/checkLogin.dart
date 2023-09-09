import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kryspy/screens/dashboard/dashboard.dart';
import 'package:kryspy/screens/dashboard/home/home_page.dart';

import '../../providers/global_providers.dart';
import '../auth/signIn.dart';

class CheckLogin extends ConsumerStatefulWidget {
  const CheckLogin({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<CheckLogin> {
  @override
  Widget build(BuildContext context) {
    final checkLoggedIn = ref.watch(checkUserLoggedIn);
    return checkLoggedIn.when(
      data: (data) {
      
        return data == null ? const SignInPage() : const DashBoardPage();
      },
      error: (error, stackTrace) => Center(
        child: Text("error $error"),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(
          strokeWidth: 1,
        ),
      ),
    );
  }
}
