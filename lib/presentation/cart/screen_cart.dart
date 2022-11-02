import 'package:flutter/material.dart';

import 'package:razer/presentation/cart/widgets/cart_item_wdget.dart';
import 'package:razer/presentation/widgets/appbar_widget.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AppBarWidget(
          title: 'My Cart',
          isSearch: true,
          count: 1,
        ),
        const CartItemWidget(),
        const Divider(
          height: 8,
        ),
      ]),
    );
  }
}
