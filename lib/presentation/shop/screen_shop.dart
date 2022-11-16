import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/presentation/cart/screen_cart.dart';
import 'package:razer/presentation/shop/screen_buy_item.dart';
import 'package:razer/presentation/shop/widgets/shop_item_widget.dart';
import 'package:razer/presentation/widgets/appbar_widget.dart';

class ScreenShop extends StatelessWidget {
  const ScreenShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Laptops',
          style: TextStyle(color: justgreen),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 27,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => ScreenCart(),
                  ),
                );
              },
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
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => ScreenBuyItem(),
                  ),
                );
              },
              child: ShopItemWidget()),
          ShopItemWidget(
            isOffer: true,
          ),
          ShopItemWidget(
            isUnavailable: true,
          ),
          ShopItemWidget(),
          ShopItemWidget(),
          ShopItemWidget(),
          ShopItemWidget(),
          ShopItemWidget(),
        ],
      ),
    );
  }
}
