import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflixapp/core/constants.dart';
import 'package:netflixapp/presentation/search/tittile.dart';
import 'package:netflixapp/presentation/widget/ImageCardTrending.dart';
import 'package:netflixapp/presentation/widget/imageCardWidget.dart';

class TrendingStackWidjet extends StatelessWidget {
  TrendingStackWidjet({super.key, required this.homepagetitle});
  String homepagetitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tittle(title: homepagetitle),
        kwidth,
        Container(
          // padding: EdgeInsets.all(20),
          // width: MediaQuery.of(context).size.width,
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ImageCardTrending(index: index),
            separatorBuilder: (context, index) => kwidth,
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
