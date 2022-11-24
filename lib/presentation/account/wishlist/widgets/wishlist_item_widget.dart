import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/functions/cart_fn.dart';
import 'package:razer/model/product_model.dart';
import 'package:razer/presentation/utils/utils.dart';

class WishlistItemWidget extends StatelessWidget {
  WishlistItemWidget({
    this.isUnavailable = false,
    required this.product,
    Key? key,
  }) : super(key: key);
  bool isUnavailable;
  Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(27, 255, 255, 255),
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(product.images[0]),
                  ),
                ),
                height: 150,
              ),
              isUnavailable
                  ? Positioned(
                      left: 0,
                      top: 15,
                      child: Container(
                        width: 140,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white12,
                        ),
                        child: Center(
                          child: Text(
                            'Currently unavailable',
                            style: TextStyle(color: theAmber, fontSize: 12),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
          Container(
            color: Color.fromARGB(27, 255, 255, 255),
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        '${product.name}',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    height_10,
                    Row(
                      children: [
                        Text(
                          'USD \$${product.price}',
                          style: TextStyle(
                              color: razergreen,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        addToCart(product: product);
                        Utils.showSnackBar(
                            context: context,
                            text: 'Added to Cart',
                            color: justgreen);
                      },
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                              color: isUnavailable
                                  ? Colors.white30
                                  : Colors.white70),
                        ),
                        child: Center(
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isUnavailable
                                    ? Colors.white30
                                    : Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
