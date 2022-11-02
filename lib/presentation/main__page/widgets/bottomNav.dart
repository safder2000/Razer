import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, child) {
        return BottomNavigationBar(
            backgroundColor: Colors.black,
            currentIndex: newIndex,
            elevation: 0,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedFontSize: 10,
            selectedFontSize: 10,
            selectedIconTheme: const IconThemeData(color: razergreen, size: 30),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_active_outlined),
                  label: 'Notifications'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: 'Account'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
            ]);
      },
    );
  }
}
