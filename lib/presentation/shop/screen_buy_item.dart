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

import 'package:razer/presentation/shop/widgets/alertboxes.dart';
import 'package:razer/presentation/shop/widgets/buttons.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../application/buying/buying_bloc.dart';

class ScreenBuyItem extends StatefulWidget {
  ScreenBuyItem({super.key, required this.product});
  Product product;

  @override
  State<ScreenBuyItem> createState() => _ScreenBuyItemState();
}

class _ScreenBuyItemState extends State<ScreenBuyItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    void _handlePaymentSuccess(PaymentSuccessResponse response) {
      showAlertBox(
          context: context,
          button1: AlertButtons.returnToShop(context),
          button2: AlertButtons.trackOrder(context),
          content: "Your Order has been placed.");
      num quantity =
          BlocProvider.of<BuyingBloc>(context).state.buyingItem.orderQuantity;
      OrderFunctions.addToOrder(
          product: widget.product, quantinty: quantity.toInt());
      // Do something when payment succeeds
    }

    void _handlePaymentError(PaymentFailureResponse response) {
      showAlertBox(
          context: context,
          button1: AlertButtons.returnToShop(context),
          button2: AlertButtons.retry(context),
          content: "Payment has been failed");
      // Do something when payment fails
    }

    void _handleExternalWallet(ExternalWalletResponse response) {
      showAlertBox(
          context: context,
          button1: AlertButtons.returnToShop(context),
          button2: AlertButtons.retry(context),
          content: "Select an external wallet");
      // Do something when an external wallet was selected
    }

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Razorpay razorpay = Razorpay();
  @override
  Widget build(BuildContext context) {
    var options = {
      'key': 'rzp_test_DYS7TJEsb2indp',
      'amount': 100,
      'name': 'Acme Corp.',
      'description': 'Demo',
      // 'retry': {'enabled': true, 'max_count': 1},
      // 'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

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
              items: widget.product.images.map((i) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.product.images.length,
                  itemBuilder: (BuildContext context, int index) =>
                      imageContainer(
                    context,
                    widget.product.images[index],
                    index,
                    widget.product.images.length,
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
                    widget.product.name,
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
                          if (ids.contains(widget.product.id)) {
                            return IconButton(
                                onPressed: () {
                                  removeFromWishlist(id: widget.product.id);
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ));
                          } else {
                            return IconButton(
                                onPressed: () {
                                  addToWishlist(product: widget.product);
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ));
                          }
                        } else {
                          return IconButton(
                              onPressed: () {
                                addToWishlist(product: widget.product);
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ));
                        }
                      } else {
                        return IconButton(
                            onPressed: () {
                              addToWishlist(product: widget.product);
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
                widget.product.description,
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
                'US  \$${widget.product.price}',
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
                    BlocProvider.of<CartBloc>(context).add(
                        AddToCart(product: widget.product, context: context));
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
                          // BlocProvider.of<BuyingBloc>(context)
                          //     .add(AddToOrders());
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

  void handlePaymentSuccessResponse(PaymentSuccessResponse response, context) {
    // orderPlacedAlert(context);
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => ScreenOederSummery(
          product: widget.product,
        ),
      ),
    );
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
