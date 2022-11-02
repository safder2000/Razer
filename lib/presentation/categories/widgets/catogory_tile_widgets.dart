import 'package:flutter/material.dart';

class CatogoryTile extends StatelessWidget {
  CatogoryTile({
    required this.imgPath,
    required this.title,
    Key? key,
  }) : super(key: key);
  String title;
  String imgPath;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(60),
          ),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imgPath), fit: BoxFit.contain),
            ),
          ),
        ),
        Text(title)
      ],
    );
  }
}
