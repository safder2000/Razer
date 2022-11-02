import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';

class WishlistItemWidget extends StatelessWidget {
  WishlistItemWidget({
    this.isUnavailable = false,
    Key? key,
  }) : super(key: key);
  bool isUnavailable;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(27, 255, 255, 255),
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('lib/assets/catogory_other.png'),
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
                        'Razer Blade 14 - Full HD 144Hz - GeForce RTX 3060 - Black',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    height_10,
                    Row(
                      children: [
                        Text(
                          'USD \$2435',
                          style: TextStyle(
                              color: razergreen,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
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
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
