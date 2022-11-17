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
          style: const TextStyle(color: justgreen),
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
                  child: Column(
                children: [
                  const Text(
                    'somthing went wrong ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '${snapshot.error}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ));
            } else if (snapshot.hasData) {
              final product = snapshot.data;
              if (product == null || product.isEmpty) {
                return const Center(
                    child: Text('No products under this catogory'));
              } else if (product.isNotEmpty) {
                return itemGrid(context, product);
              } else {
                return const Center(child: Text('unknown error'));
              }
            } else {
              return const Center(child: CircularProgressIndicator());
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
