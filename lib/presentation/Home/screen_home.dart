import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflixapp/core/constants.dart';
import 'package:netflixapp/presentation/Home/widget/homeRowWidjet.dart';
import 'package:netflixapp/presentation/Home/widget/tredingStackWidget.dart';
import 'package:netflixapp/presentation/widget/app_bar_widgget.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  ValueNotifier scrollNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: ((notification) {
              final ScrollDirection direction = notification.direction;
              print(direction);
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = true;
              } else {
                scrollNotifier.value = false;
              }
              return true;
            }),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      scrollNotifier.value
                          ? kheight
                          : AppBarWidget(
                              heading: "heading", FlagTextOrImage: true),
                      const HomeScreenTopControls(),
                      const homeStartContainer(),
                      bottonControlbuttonHomeScreen(),
                      HomeRowWidget(
                        homepagetitle: "Released in the Past Year",
                        poster:
                            "https://image.tmdb.org/t/p/w500//wybmSmviUXxlBmX44gtpow5Y9TB.jpg",
                      ),
                      HomeRowWidget(
                        homepagetitle: "Trending",
                        poster:
                            "https://image.tmdb.org/t/p/w500//tFGlVxcj3YuLPtbhLRTOhyIUuzw.jpg",
                      ),
                      TrendingStackWidjet(homepagetitle: "Trending tv shows"),
                      HomeRowWidget(
                        homepagetitle: "Released in the Past Year",
                        poster:
                            "https://image.tmdb.org/t/p/w500//8YFL5QQVPy3AgrEQxNYVSgiPEbe.jpg",
                      ),
                      HomeRowWidget(
                        homepagetitle: "Trending",
                        poster:
                            "https://image.tmdb.org/t/p/w500//wybmSmviUXxlBmX44gtpow5Y9TB.jpg",
                      ),
                      HomeRowWidget(
                        homepagetitle: "Popular",
                        poster:
                            "https://image.tmdb.org/t/p/w500//xUfRZu2mi8jH6SzQEJGP6tjBuYj.jpg",
                      )
                    ],
                  ),
                  //),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class homeStartContainer extends StatelessWidget {
  const homeStartContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://image.tmdb.org/t/p/w500//wybmSmviUXxlBmX44gtpow5Y9TB.jpg"),
          )),
        ),
      ],
    );
  }
}

class HomeScreenTopControls extends StatelessWidget {
  const HomeScreenTopControls({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text("Tv Shows"),
        const Text("Movies"),
        DropdownButton<String>(
          hint: const Text(
            'categories',
            style: TextStyle(color: Colors.white),
          ),
          items: <String>['categories', 'B', 'C', 'D'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ],
    );
  }
}

class bottonControlbuttonHomeScreen extends StatelessWidget {
  const bottonControlbuttonHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      //bottom: 5,
      child: Container(
        color: Colors.black,
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const homeControllButtons(
              icon: Icon(Icons.add),
              IconTitle: "My List",
            ),
            Container(
                height: 35,
                // margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      // padding: EdgeInsets.all(3),
                      onPressed: () {},
                      icon: Icon(Icons.play_arrow),
                      color: Colors.black,
                    ),
                    const Text(
                      "play",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )
                  ],
                )),
            const homeControllButtons(
              icon: Icon(Icons.info_outline_rounded),
              IconTitle: "info",
            )
          ],
        ),
      ),
    );
  }
}

class homeControllButtons extends StatelessWidget {
  const homeControllButtons(
      {Key? key, required this.icon, required this.IconTitle})
      : super(key: key);

  final Widget icon;
  final String IconTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      //  width: MediaQuery.of(context).size.width * 0.3,
      child: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: icon,
            color: Colors.white,
          ),
          Text(IconTitle)
        ],
      ),
    );
  }
}
