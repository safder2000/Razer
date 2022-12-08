import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:razer/application/cart/cart_bloc.dart';

import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/functions/order_functions/order_functions.dart';
import 'package:razer/functions/wishlist_functions.dart';
import 'package:razer/model/product_model.dart';
import 'package:razer/presentation/cart/screen_cart.dart';
import 'package:razer/presentation/shop/order_summery/screen_order_summary.dart';
import 'package:razer/presentation/shop/payment/track_order.dart';
import 'package:razer/presentation/shop/screen_shop.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../application/buying/buying_bloc.dart';

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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute<void>(
                    //     builder: (BuildContext context) => ScreenOederSummery(
                    //       product: product,
                    //     ),
                    //   ),
                    // );
                  },
                  child: BlocBuilder<BuyingBloc, BuyingState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          OrderFunctions.addToOrder(
                            product: product,
                            quantinty: int.parse(
                                state.buyingItem.orderQuantity.toString()),
                          );
                          // BlocProvider.of<BuyingBloc>(context)
                          //     .add(AddToOrders());
                          Razorpay razorpay = Razorpay();
                          var options = {
                            'key': 'rzp_test_DYS7TJEsb2indp',
                            'amount': 100,
                            'name': 'Acme Corp.',
                            'description': 'Fine T-Shirt',
                            'retry': {'enabled': true, 'max_count': 1},
                            'send_sms_hash': true,
                            'prefill': {
                              'contact': '8888888888',
                              'email': 'test@razorpay.com'
                            },
                            'external': {
                              'wallets': ['paytm']
                            }
                          };
                          razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                              handlePaymentErrorResponse);
                          razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                              handlePaymentSuccessResponse);
                          razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                              handleExternalWalletSelected);
                          razorpay.open(options);

                          // orderPlacedAlert(context);
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
                      );
                    },
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
  //========================== update

  static orderPlacedAlert(BuildContext context) {
    // set up the button
    Widget toShop = TextButton(
      child: Text("Shop again"),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return TrackOrder();
            },
          ),
        );
      },
    );
    Widget toTrack = TextButton(
      child: Text("Track Order"),
      onPressed: () {
        Navigator.pop(context);

        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return ScreenShop(
                catogory: 'all',
              );
            },
          ),
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color.fromARGB(255, 46, 46, 46),
      content: const Text(
        "Your Order has been placed.",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      actions: [
        toShop,
        toTrack,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response, context) {
    orderPlacedAlert(context);
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response, context) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response, context) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
