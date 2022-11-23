import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/model/product_model.dart';

class ShopItemWidget extends StatelessWidget {
  ShopItemWidget({
    required this.product,
    this.isOffer = false,
    this.isUnavailable = false,
    Key? key,
  }) : super(key: key);
  bool isOffer;
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
              isUnavailable
                  ? Positioned(
                      left: 0,
                      top: 15,
                      child: Container(
                        width: 140,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.white12,
                        ),
                        child: const Center(
                          child: Text(
                            'Currently unavailable',
                            style: TextStyle(color: theAmber, fontSize: 12),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              isOffer
                  ? Positioned(
                      left: 0,
                      top: 15,
                      child: Container(
                        width: 50,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.white12,
                        ),
                        child: const Center(
                          child: Text(
                            '20%',
                            style: TextStyle(
                                color: razergreen,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(22, 167, 167, 167),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("${product.images[0]}"),
                    // AssetImage('lib/assets/catogory_pc.png')
                  ),
                ),
                height: 150,
              ),
            ],
          ),
          Container(
            color: const Color.fromARGB(27, 255, 255, 255),
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      child: Text(
                        product.name,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    // Text('Razer Blade 14 - QHD ...'),
                    height_5,
                    SizedBox(
                      height: 31,
                      child: Text(
                        product.description,
                        style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    // Text(
                    //   '14-inch Gaming Laptop with AMD Ryzen™ 6900HX   ',
                    //   style: TextStyle(color: Colors.white60, fontSize: 12),
                    // ),
                    height_10,
                    Row(
                      children: [
                        isOffer
                            ? Row(
                                children: [
                                  Text(
                                    ("\$${product.price}"),
                                    overflow: TextOverflow.ellipsis,
                                    // '\$2435',
                                    style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.white70,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    ' USD \$2000',
                                    style: TextStyle(
                                        color: razergreen,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            : isUnavailable
                                ? Text(
                                    "USD\$${product.price}",
                                    style: const TextStyle(
                                        color: Colors.white60,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    'USD \$${product.price}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                        const Spacer(),
                        // Container(
                        //   height: 15,
                        //   width: 30,
                        //   decoration: BoxDecoration(
                        //     color: justgreen,
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        //   child: Text(
                        //     'buy',
                        //     style: TextStyle(
                        //         color: Colors.black87,
                        //         fontSize: 11,
                        //         fontWeight: FontWeight.bold),
                        //     textAlign: TextAlign.center,
                        //   ),
                        // )
                      ],
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
