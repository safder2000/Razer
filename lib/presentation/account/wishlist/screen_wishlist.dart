import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/functions/wishlist_functions.dart';
import 'package:razer/model/product_model.dart';
import 'package:razer/presentation/account/wishlist/widgets/wishlist_item_widget.dart';
import 'package:razer/presentation/shop/screen_buy_item.dart';
import 'package:razer/presentation/shop/widgets/shop_item_widget.dart';
import 'package:razer/presentation/widgets/appbar_widget.dart';

class ScreenWishlist extends StatelessWidget {
  const ScreenWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Product>>(
        stream: readWishlist(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final _product = snapshot.data;
            if (_product != null && _product.isNotEmpty) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'My Wishlist (${_product.length.toString()})',
                    style: const TextStyle(color: justgreen),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 27,
                        ))
                  ],
                  backgroundColor: Colors.black,
                ),
                body: GridView.builder(
                  itemCount: _product.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 8 / 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ScreenBuyItem(
                              product: _product[index],
                            ),
                          ),
                        );
                      },
                      child: WishlistItemWidget(
                        product: _product[index],
                      ),
                    );
                  },

                  // GestureDetector(
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute<void>(
                  //           builder: (BuildContext context) => ScreenBuyItem(),
                  //         ),
                  //       );
                  //     },
                  //     child: WishlistItemWidget()),
                ),
              );
            } else {
              return const Center(
                child: Text('Your WishList is Empty'),
              );
            }
          } else {
            return const Center(
              child: Text('Your WishList is Empty'),
            );
          }
        });
  }
}
