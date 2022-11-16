import 'package:flutter/material.dart';

class UpiCard extends StatelessWidget {
  const UpiCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: 80,
          color: Colors.white24,
          child: Stack(
            children: [
              Row(),
              Positioned(
                left: 24,
                top: 30,
                child: Container(
                  color: Colors.white,
                  child: const Text(
                    'Makima2000@ylb                              ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            border: Border.all(color: Colors.white24, width: 2),
          ),
          child: const Center(child: Text('Remove This ID')),
        ),
      ],
    );
  }
}
