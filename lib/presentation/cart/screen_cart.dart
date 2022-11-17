import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/functions/cart_fn.dart';
import 'package:razer/functions/product_functions.dart';
import 'package:razer/model/product_model.dart';

import 'package:razer/presentation/cart/widgets/cart_item_wdget.dart';
import 'package:razer/presentation/widgets/appbar_widget.dart';

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
              return ListView.builder(
                itemBuilder: (BuildContext, index) =>
                    CartItemWidget(product: products[index]),
                itemCount: products!.length,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
