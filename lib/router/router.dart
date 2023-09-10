import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kryspy/model/product_model.dart';
import 'package:kryspy/screens/auth/signIn.dart';
import 'package:kryspy/screens/auth/signUp.dart';
import 'package:kryspy/screens/dashboard/cart/cartPage.dart';
import 'package:kryspy/screens/dashboard/dashboard.dart';
import 'package:kryspy/screens/dashboard/favourite/favourite.dart';
import 'package:kryspy/screens/dashboard/home/home_page.dart';
import 'package:kryspy/screens/dashboard/profile/profile.dart';

import '../screens/category/productByCategory.dart';
import '../screens/check/checkLogin.dart';
import '../screens/dashboard/home/create_item.dart';
import '../screens/details/productDetailPage.dart';

var routeProvider = Provider((ref) => GoRouter(initialLocation: '/', routes: [
      GoRoute(
        path: '/',
        name: 'check',
        builder: (context, state) => const CheckLogin(),
      ),
      GoRoute(
        path: '/signIn',
        name: 'signIn',
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: '/signUp',
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: '/dashboard',
        name: 'dashboard',
        builder: (context, state) => const DashBoardPage(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => HomePage(
          name: state.queryParameters["name"],
        ),
      ),
      GoRoute(
        path: '/fav',
        name: 'fav',
        builder: (context, state) => FavouritePage(),
      ),
      GoRoute(
        path: '/cart',
        name: 'cart',
        builder: (context, state) => CartPage(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => ProfilePage(),
      ),
      GoRoute(
        path: '/createItem',
        builder: (context, state) => const CreateItem(),
      ),
      GoRoute(
          path: '/productDetail',
          name: 'productDetail',
          builder: (context, state) {
            ProductModel model = state.extra as ProductModel;
            return ProductDetailPage(productModel: model);
          }),
      GoRoute(
          path: '/productByCategory',
          name: 'productByCategory',
          builder: (context, state) {
            return ProductByCategory(
                categoryName: state.queryParameters['categoryName']!);
          })
    ]));
