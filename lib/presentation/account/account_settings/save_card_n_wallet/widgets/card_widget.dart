import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: 150,
          color: Colors.white24,
          child: Stack(
            children: [
              Row(),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  height: 20,
                  width: 50,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10)),
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.freepnglogos.com/uploads/visa-card-logo-9.png'),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 45,
                child: Container(
                  color: Colors.white,
                  child: const Text(
                    'X X X X    X X X X    X X X X X    4 2 6 7 ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 90,
                child: Container(
                  color: Colors.white,
                  child: const Text(
                    '12 / 25',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              )
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
          child: const Center(child: Text('Remove This Card')),
        ),
      ],
    );
  }
}
