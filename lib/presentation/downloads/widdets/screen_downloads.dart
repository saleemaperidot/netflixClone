import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/application/downloadsbloc/downloads_bloc.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/constants.dart';
import 'package:netflixapp/core/urlStrings.dart';
import 'package:netflixapp/presentation/widget/app_bar_widgget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          heading: "Downloads",
          FlagTextOrImage: false,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          const _smartDownloads(),
          kheight,
          middleSection(),
          buttonSection(),
        ],
      ),
    );
  }
}

class buttonSection extends StatelessWidget {
  const buttonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {},
            child: const Text("Set Up"),
            color: kButtonBlue,
            textColor: kButtonTextColor,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {},
            child: const Text("See what to download"),
            color: kButtonWhite,
            textColor: Colors.black,
          ),
        )
      ],
    );
  }
}

class middleSection extends StatelessWidget {
  middleSection({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
    // BlocProvider.of<DownloadsBloc>(context)
    //  .add(DownloadsEvent.getDownloadsImage());
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          "We will download a personalized section of \nmovies and shows for you,so there's\n is something to watch on your \ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            // $downloadAppendImage
            print('$downloadAppendImage${state.downloadImage}');
            print("state print" +
                '$downloadAppendImage${state.downloadImage[0].posterPath}');
            return SizedBox(
              height: 450,
              width: 450,
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(alignment: AlignmentDirectional.center, children: [
                      CircleAvatar(
                        radius: size.width * 0.40,
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        //backgroundImage: NetworkImage(imageList[0]),
                      ),

                      imageRotated(
                          angle: 20,
                          image:
                              '$downloadAppendImage${state.downloadImage[0].posterPath}',
                          //  "https://image.tmdb.org/t/p/w500//uKvVjHNqB5VmOrdxqAt2F7J78ED.jpg",
                          //'$downloadAppend${state.downloadImage[0].posterPath}',
                          margin: EdgeInsets.only(left: 160, bottom: 50)),
                      imageRotated(
                          angle: -20,
                          image:
                              '$downloadAppendImage${state.downloadImage[1].posterPath}',
                          // "https://image.tmdb.org/t/p/w500//uKvVjHNqB5VmOrdxqAt2F7J78ED.jpg",
                          //'$downloadAppendImage${state.downloadImage[0].posterPath}',
                          margin: EdgeInsets.only(right: 160, bottom: 50)),
                      imageRotated(
                        angle: 1,
                        image:
                            '$downloadAppendImage${state.downloadImage[2].posterPath}',
                        // "https://image.tmdb.org/t/p/w500/uKvVjHNqB5VmOrdxqAt2F7J78ED.jpg",
                        // '$downloadAppend${state.downloadImage[0].posterPath}',
                        margin: EdgeInsets.only(top: 0),
                        heightscale: 0.65,
                      ),
                      //Container(),
                    ]),
            );
          },
        ),
      ],
    );
  }
}

class _smartDownloads extends StatelessWidget {
  const _smartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kwidth,
        Icon(
          Icons.settings,
          color: textAndIconColor,
        ),
        kwidth,
        Text("Smart Downloads")
      ],
    );
  }
}

class imageRotated extends StatelessWidget {
  imageRotated(
      {Key? key,
      required this.angle,
      required this.image,
      required this.margin,
      this.heightscale = 0.58})
      : super(key: key);
  final EdgeInsets margin;
  final angle;
  final String image;
  double heightscale;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        height: size.width * heightscale,
        width: size.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(
              image,
            ),
            //whatever image you can put here
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
