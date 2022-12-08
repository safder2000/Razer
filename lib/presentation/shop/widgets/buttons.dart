import 'package:flutter/material.dart';
import 'package:razer/presentation/shop/payment/track_order.dart';
import 'package:razer/presentation/shop/screen_shop.dart';

class AlertButtons {
  static Widget trackOrder(context) => TextButton(
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

  static Widget returnToShop(context) {
    return TextButton(
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
  }

  static Widget retry(context) {
    return TextButton(
      child: Text("Retry"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
