import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavouritePageState();
}

class _FavouritePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Profile  Page"),
    );
  }
}
