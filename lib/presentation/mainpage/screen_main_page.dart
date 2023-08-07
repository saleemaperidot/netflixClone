import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/presentation/Home/screen_home.dart';
import 'package:netflixapp/presentation/downloads/widdets/screen_downloads.dart';
import 'package:netflixapp/presentation/fastLaugh/screen_fastLaugh.dart';
import 'package:netflixapp/presentation/gallary/gallery.dart';
import 'package:netflixapp/presentation/mainpage/widgets/bottom_navigation.dart';
import 'package:netflixapp/presentation/newAndHot/screen_newAndSearch.dart';
import 'package:netflixapp/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: navigationNotifier,
        builder: (context, value, _) {
          return SafeArea(
            child: pages[value],
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
