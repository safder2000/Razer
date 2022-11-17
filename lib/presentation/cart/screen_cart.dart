import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/functions/cart_fn.dart';

import 'package:razer/model/product_model.dart';

import 'package:razer/presentation/cart/widgets/cart_item_wdget.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(color: justgreen, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder<List<Product>>(
          stream: readCart(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text(
                'somthing went wrong ${snapshot.error}',
                style: TextStyle(color: Colors.white),
              ));
            } else if (snapshot.hasData) {
              final products = snapshot.data;
              if (products == null || products.isEmpty) {
                return Center(
                    child: Container(
                        decoration: BoxDecoration(
                  // borderRadius:BorderRadius(Radius.circular(20)) ,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://shop.millenniumbooksource.com/static/images/cart1.png')),
                )));
              } else if (products.isNotEmpty) {
                return ListView.builder(
                  itemBuilder: (BuildContext, index) =>
                      CartItemWidget(product: products[index]),
                  itemCount: products.length,
                );
              } else {
                return const Center(child: Text('unknown error'));
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
