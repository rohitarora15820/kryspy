import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kryspy/screens/dashboard/cart/cartPage.dart';
import 'package:kryspy/screens/dashboard/favourite/favourite.dart';
import 'package:kryspy/screens/dashboard/home/home_page.dart';
import 'package:kryspy/screens/dashboard/home/main_page.dart';
import 'package:kryspy/screens/dashboard/profile/profile.dart';

class DashBoardPage extends ConsumerStatefulWidget {
  const DashBoardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends ConsumerState<DashBoardPage> {
   int selectedIndex = 0;
    void _onPageChanged(int index) {
      setState(() {
        selectedIndex = index;
      });
      print(selectedIndex.toString());
    }

    List<Widget> items = [
      const MainPage(),
      const FavouritePage(),
      const CartPage(),
      const ProfilePage()
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.orange,
      
        unselectedItemColor: Colors.grey,
        onTap: _onPageChanged,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "Favourite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: "Profile",
          )
        ],
      ),
      body: items[selectedIndex],
    );
  }
}
