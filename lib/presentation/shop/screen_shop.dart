import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/functions/product_functions.dart';
import 'package:razer/model/product_model.dart';
import 'package:razer/presentation/cart/screen_cart.dart';
import 'package:razer/presentation/shop/screen_buy_item.dart';
import 'package:razer/presentation/shop/widgets/shop_item_widget.dart';

class ScreenShop extends StatelessWidget {
  ScreenShop({super.key, required this.catogory});
  String catogory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          catogory,
          style: TextStyle(color: justgreen),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 27,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const ScreenCart(),
                  ),
                );
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 27,
              ))
        ],
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder<List<Product>>(
          stream: ProductFn.readProducts(catogory: catogory),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text(
                'somthing went wrong ${snapshot.error}',
                style: TextStyle(color: Colors.white),
              ));
            } else if (snapshot.hasData) {
              final product = snapshot.data;
              return itemGrid(context, product!);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  GridView itemGrid(BuildContext context, List<Product> products) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 8 / 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => ScreenBuyItem(
                  product: products[index],
                ),
              ),
            );
          },
          child: ShopItemWidget(
            product: products[index],
          ),
        );
      },
    );
  }
}
