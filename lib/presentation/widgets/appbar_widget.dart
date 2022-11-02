import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({
    required this.title,
    this.imgPath,
    this.isSearch = false,
    this.count,
    Key? key,
  }) : super(key: key);
  String title;
  int? count;

  String? imgPath;
  bool isImg = false;
  bool isSearch;
  bool isCount = false;

  @override
  Widget build(BuildContext context) {
    if (imgPath != null) {
      isImg = true;
    }
    if (count != null) {
      isCount = true;
    }
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            isImg
                ? Container(
                    height: 80,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imgPath!),
                      ),
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  )
                : const SizedBox(
                    height: 60,
                  ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            isCount
                ? Text(
                    '  [ $count ]',
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                : SizedBox(),
            const Spacer(),
            isSearch
                ? IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: razergreen,
                      size: 28,
                    ))
                : SizedBox(),
          ],
        ),
        Divider(
          color: razergreen,
          height: 0,
        ),
      ],
    );
  }
}
