import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer/application/cart/cart_bloc.dart';

import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color.fromARGB(19, 255, 255, 255),
            height: 250,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: product.images.isEmpty
                      ? NetworkImage(
                          'https://assets3.razerzone.com/TnqXo5lYR1pUaLT9vEhWg49uD7c=/1500x1000/https%3A%2F%2Fhybrismediaprod.blob.core.windows.net%2Fsys-master-phoenix-images-container%2Fh27%2Fhde%2F9286404898846%2F210104-blade14-p8-fhd-1500x1000-3.jpg',
                        )
                      : NetworkImage(product.images[0]),
                ),
              ),
            ),
          ),
          height_10,
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.93,
                  child: Text(
                    product.name,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
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
}
