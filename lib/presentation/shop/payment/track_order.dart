import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/core/constents.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Track your order',
          style: TextStyle(
              color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [],
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              children: [
                width_5,
                CircleAvatar(
                  radius: 10,
                ),
                width_10,
                Text('Order Confirmed'),
                width_10,
                Text(
                  '03 / nov /22 . 2:30 PM ',
                  style: TextStyle(color: Colors.white60, fontSize: 13),
                ),
              ],
            ),
            Row(
              children: [
                width_10,
                width_5,
                Container(
                  width: 2,
                  height: 100,
                  color: justgreen,
                ),
              ],
            ),
            Row(
              children: [
                width_5,
                CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 10,
                ),
                width_10,
                Text('Shipped'),
              ],
            ),
            Row(
              children: [
                width_10,
                width_5,
                Container(
                  width: 2,
                  height: 100,
                  color: Colors.white70,
                ),
              ],
            ),
            Row(
              children: [
                width_5,
                CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 10,
                ),
                width_10,
                Text('Out for Delivery'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white38, borderRadius: BorderRadius.circular(8)),
          child: const Center(
            child: Text(
              '  back to Home  ',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        width_20,
        width_10,
        Container(
          height: 50,
          decoration: BoxDecoration(
              color: theAmber, borderRadius: BorderRadius.circular(8)),
          child: const Center(
            child: Text(
              ' Track Order ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
