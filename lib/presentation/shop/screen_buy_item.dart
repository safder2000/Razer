import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/presentation/shop/order_summery/screen_order_summary.dart';

class ScreenBuyItem extends StatelessWidget {
  const ScreenBuyItem({super.key});

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
              onPressed: () {},
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
                  image: NetworkImage(
                    'https://assets3.razerzone.com/TnqXo5lYR1pUaLT9vEhWg49uD7c=/1500x1000/https%3A%2F%2Fhybrismediaprod.blob.core.windows.net%2Fsys-master-phoenix-images-container%2Fh27%2Fhde%2F9286404898846%2F210104-blade14-p8-fhd-1500x1000-3.jpg',
                  ),
                ),
              ),
            ),
          ),
          height_10,
          Text(
            'Razer Blade 14 - QHD 165Hz - GeForce RTX 3080 Ti - Black',
            style: TextStyle(fontSize: 18),
          ),
          height_10,
          height_10,
          Text(
            '14-inch Gaming Laptop with AMD Ryzen™ 6900HX ',
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          height_10,
          Container(
            height: 40,
            width: 150,
            color: Colors.white10,
            child: Center(
              child: Text(
                'US  \$3,456.99',
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
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ScreenOederSummery(),
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
