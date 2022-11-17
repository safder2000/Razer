import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/presentation/account/wishlist/widgets/wishlist_item_widget.dart';
import 'package:razer/presentation/shop/screen_buy_item.dart';
import 'package:razer/presentation/shop/widgets/shop_item_widget.dart';
import 'package:razer/presentation/widgets/appbar_widget.dart';

class ScreenWishlist extends StatelessWidget {
  const ScreenWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Wishlist ( 3 )',
          style: TextStyle(color: justgreen),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 27,
              ))
        ],
        backgroundColor: Colors.black,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 8 / 10,
        children: [
          GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute<void>(
                //     builder: (BuildContext context) => ScreenBuyItem(),
                //   ),
                // );
              },
              child: WishlistItemWidget()),
          WishlistItemWidget(),
          WishlistItemWidget(
            isUnavailable: true,
          ),
        ],
      ),
    );
  }
}
