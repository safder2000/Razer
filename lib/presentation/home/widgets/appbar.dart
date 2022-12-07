import 'package:flutter/material.dart';
import 'package:razer/core/colors.dart';
import 'package:razer/presentation/search/screen_search.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 80,
              width: 120,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/named_logo.png'),
                ),
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => ScreenSearch(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  color: razergreen,
                  size: 28,
                ))
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
