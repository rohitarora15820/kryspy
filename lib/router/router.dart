import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kryspy/screens/auth/signIn.dart';
import 'package:kryspy/screens/auth/signUp.dart';
import 'package:kryspy/screens/home/home_page.dart';

import '../screens/home/create_item.dart';

var routeProvider = Provider((ref) => GoRouter(initialLocation: '/', routes: [
      GoRoute(
        path: '/',
        name: 'signIn',
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: '/signUp',
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => HomePage(
          name: state.queryParameters["name"],
        ),
      ),
      GoRoute(
        path: '/createItem',
        builder: (context, state) => const CreateItem(),
      ),
    ]));
