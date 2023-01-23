// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:razer/presentation/home/widgets/appbar.dart';
import 'package:razer/presentation/home/widgets/home_tiles_widgets.dart';

import '../../functions/check_permission/location_permission.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    requestPermission(context);
    return Scaffold(
      body: Column(
        children: [
          const HomeAppBarWidget(),
          Expanded(
            child: ListView(
              children: [
                const HomeTilesWidgets(
                  title: 'NEW RAZER BLADE 14',
                  sub: 'ULTRA QUARTZ.ULTRA POWERFUL',
                  cover: 'lib/assets/razer-blade.jpg',
                ),
                const HomeTilesWidgets(
                  title: 'RAZER EDGE',
                  sub: 'THE ULTIMATE ANDROID GAMING HANDHELD',
                  cover: 'lib/assets/razer-edge-hero.jpg',
                ),
                const HomeTilesWidgets(
                  title: 'RAZER DEATHSTALKER V2 PRO',
                  sub: 'TOP-CLASS CONNECTIVITY',
                  cover:
                      'lib/assets/razer-deathstalker-v2-pro-white-usp1-low-profile-optical-switches-desktop.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
