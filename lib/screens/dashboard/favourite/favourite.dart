import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritePage extends ConsumerStatefulWidget {
  const FavouritePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavouritePageState();
}

class _FavouritePageState extends ConsumerState<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Favourite"),
    );
  }
}
