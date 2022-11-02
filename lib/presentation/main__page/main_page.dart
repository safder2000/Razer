import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/presentation/account/screen_account.dart';
import 'package:razer/presentation/cart/screen_cart.dart';
import 'package:razer/presentation/categories/screen_categories.dart';
import 'package:razer/presentation/home/screen_home.dart';
import 'package:razer/presentation/main__page/widgets/bottomNav.dart';
import 'package:razer/presentation/notifications/screen_notifications.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    ScreenHome(),
    ScreenCategories(),
    ScreenNotifications(),
    ScreenAccount(),
    ScreenCart()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
