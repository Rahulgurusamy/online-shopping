import 'package:flutter/material.dart';
import 'package:online_shopping/pages/account_page.dart';
import 'package:online_shopping/pages/cart_page.dart';
import 'package:online_shopping/pages/categories_page.dart';
import 'package:online_shopping/pages/explore_page.dart';
import 'package:online_shopping/pages/home_page.dart';
import 'package:online_shopping/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class BottomNavigation extends StatefulWidget {
  static const routeName = '/bottom-navigation';

  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const ExplorePage(),
    const CategoriesPage(),
    const AccountPage(),
    const CartPage(),
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).filteredProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentIndex = 4;
          });
        },
        child: const Icon(Icons.shopping_cart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [Icons.home, Icons.explore, Icons.category, Icons.account_circle],
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
