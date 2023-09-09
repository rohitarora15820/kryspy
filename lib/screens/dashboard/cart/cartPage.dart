import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavouritePageState();
}

class _FavouritePageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("CartPage"),
    );
  }
}
