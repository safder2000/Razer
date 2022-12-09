import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/model/product_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:razer/presentation/shop/order_summery/screen_order_summary.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';
import 'package:razer/presentation/shop/screen_buy_item.dart';
import '../../../application/cart/cart_bloc.dart';

class CartItemWidget extends StatelessWidget {
  CartItemWidget({
    required this.product,
    Key? key,
  }) : super(key: key);
  Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white12,
      height: 180,
      child: Column(
        children: [
          Row(
            children: [
              width_5,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(product.images[0])),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              width_5,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height_10,
                  SizedBox(
                    width: 290,
                    child: Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  height_10,
                  SizedBox(
                    width: 290,
                    child: Text(
                      product.description,
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  height_10,
                  Text(
                    '\$ ${product.price}',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
          // Row(
          //   children: [
          //     GestureDetector(
          //       onTap: () {
          //         itemCount(context);
          //       },
          //       child: Container(
          //         height: 30,
          //         width: 73,
          //         margin: const EdgeInsets.all(15.0),
          //         decoration: BoxDecoration(
          //           border: Border.all(color: razergreen),
          //           borderRadius: BorderRadius.circular(5),
          //         ),
          //         child: Row(children: const [
          //           Text('  Qty: 1'),
          //           Icon(
          //             Icons.arrow_drop_down,
          //             color: razergreen,
          //           )
          //         ]),
          //       ),
          //     ),
          //     const Spacer(),
          //     RatingBarIndicator(
          //       rating: product.rating.toDouble(),
          //       itemBuilder: (context, index) => const Icon(
          //         Icons.star,
          //         color: Colors.amber,
          //       ),
          //       itemCount: 5,
          //       itemSize: 30.0,
          //       direction: Axis.horizontal,
          //     ),
          //     width_10,
          //     width_10,
          //   ],
          // ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => BlocProvider.of<CartBloc>(context)
                      .add(RemoveFromCart(context: context, product: product)),
                  child: CustomButton(
                    text: AppLocalizations.of(context)!.remove,
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            ScreenOederSummery(product: product),
                        // ScreenBuyItem(product: product),
                      ),
                    );
                  },
                  child: CustomButton(
                    text: AppLocalizations.of(context)!.buyNow,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  itemCount(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text(
        "Cancel",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text(
        "Save",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          height_20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              countTile(lang: '1', isSelected: true),
              width_20,
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white70),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  height_5,
                  height_5,
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white70),
                    ),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          height_10,
        ],
      ),
      actions: [
        cancelButton,
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

  Row countTile({required String lang, bool isSelected = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        width_10,
        Container(
          height: 70,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.white70),
          ),
          child: Center(
            child: Text(
              lang,
              style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.text,
    Key? key,
  }) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(border: Border.all(color: Colors.white38)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
