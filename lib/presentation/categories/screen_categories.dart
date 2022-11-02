import 'package:flutter/material.dart';
import 'package:razer/core/constents.dart';
import 'package:razer/presentation/categories/widgets/catogory_tile_widgets.dart';
import 'package:razer/presentation/shop/screen_shop.dart';
import 'package:razer/presentation/widgets/appbar_widget.dart';

class ScreenCategories extends StatelessWidget {
  const ScreenCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        AppBarWidget(
          title: "Catogory",
        ),
        height_10,
        height_10,
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => ScreenShop(),
                    ),
                  );
                },
                child: CatogoryTile(
                    imgPath: 'lib/assets/catogory_pc.png', title: 'LapTops'),
              ),
              CatogoryTile(
                  imgPath: 'lib/assets/catogory_components.png',
                  title: 'Components'),
              CatogoryTile(
                  imgPath: 'lib/assets/catogory_mouse.png', title: 'Mice'),
              CatogoryTile(
                  imgPath: 'lib/assets/catogory_keybord.png',
                  title: 'Keybords  '),
              CatogoryTile(
                  imgPath: 'lib/assets/catogory_audio.png', title: 'Audio'),
              CatogoryTile(
                  imgPath: 'lib/assets/catogory_streaming.png',
                  title: 'Streaming'),
              CatogoryTile(
                  imgPath: 'lib/assets/catogory_chair.png', title: 'Chairs'),
              CatogoryTile(
                  imgPath: 'lib/assets/catogory_console.png', title: 'Console'),
              CatogoryTile(
                  imgPath: 'lib/assets/catogory_mobile.png', title: 'Mobile'),
              CatogoryTile(
                  imgPath: 'lib/assets/catogory_other.png', title: 'Gear'),
            ],
          ),
        ),
      ],
    ));
  }
}
