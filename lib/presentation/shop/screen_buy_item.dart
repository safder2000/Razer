import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:razer/application/cart/cart_bloc.dart';

import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/functions/wishlist_functions.dart';
import 'package:razer/model/product_model.dart';
import 'package:razer/presentation/cart/screen_cart.dart';
import 'package:razer/presentation/shop/order_summery/screen_order_summary.dart';

class ScreenBuyItem extends StatelessWidget {
  ScreenBuyItem({super.key, required this.product});
  Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height_20,
          Container(
            color: Color.fromARGB(19, 255, 255, 255),
            height: 250,
            child: CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: product.images.map((i) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: product.images.length,
                  itemBuilder: (BuildContext context, int index) =>
                      imageContainer(
                    context,
                    product.images[index],
                    index,
                    product.images.length,
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: 10,
                  ),
                );
              }).toList(),
            ),
          ),
          height_10,
          height_20,
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    product.name,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                StreamBuilder<List<Product>>(
                    stream: readWishlist(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final _product = snapshot.data;
                        if (_product != null && _product.isNotEmpty) {
                          List<String> ids = [];
                          for (Product element in _product) {
                            ids.add(element.id);
                          }
                          if (ids.contains(product.id)) {
                            return IconButton(
                                onPressed: () {
                                  removeFromWishlist(id: product.id);
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ));
                          } else {
                            return IconButton(
                                onPressed: () {
                                  addToWishlist(product: product);
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ));
                          }
                        } else {
                          return IconButton(
                              onPressed: () {
                                addToWishlist(product: product);
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ));
                        }
                      } else {
                        return IconButton(
                            onPressed: () {
                              addToWishlist(product: product);
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ));
                      }
                    }),
              ],
            ),
          ),
          height_10,
          height_10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.93,
              child: Text(
                product.description,
                overflow: TextOverflow.clip,
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ),
          ),
          height_10,
          Container(
            height: 40,
            width: 150,
            color: Colors.white10,
            child: Center(
              child: Text(
                'US  \$${product.price}',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: razergreen),
              ),
            ),
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<CartBloc>(context)
                        .add(AddToCart(product: product, context: context));
                  },
                  child: Container(
                    height: 60,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        'Add To Cart',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ScreenOederSummery(
                          product: product,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 60,
                    color: theAmber,
                    child: Center(
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  imageContainer(context, imgUrl, index, total) {
    final srcWidth = MediaQuery.of(context).size.width * 0.9;
    return Stack(children: [
      Container(
        width: srcWidth,
        height: srcWidth * 0.7,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
          image: DecorationImage(
            image: NetworkImage(imgUrl),
          ),
        ),
      ),
      Positioned(
        bottom: 5,
        left: 0,
        right: 0,
        child: GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            child: Text('${index + 1}/$total'),
          ),
        ),
      )
    ]);
  }
}
