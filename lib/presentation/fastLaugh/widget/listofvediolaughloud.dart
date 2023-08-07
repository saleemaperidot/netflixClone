import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflixapp/application/fastLaugh/fast_laugh_bloc.dart';
import 'package:netflixapp/core/urlStrings.dart';
import 'package:netflixapp/domain/download/Models/downloadModel.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class listOfVedioLaughLoudIherited extends InheritedWidget {
  final Widget widget;
  final downloadModel movieData;
  const listOfVedioLaughLoudIherited(
      {super.key, required this.widget, required this.movieData})
      : super(child: widget);

  @override
  bool updateShouldNotify(covariant listOfVedioLaughLoudIherited oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static listOfVedioLaughLoudIherited? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<listOfVedioLaughLoudIherited>();
  }
}

class listOfVedioLaughLoud extends StatelessWidget {
  const listOfVedioLaughLoud({super.key, required this.index});
  final index;
  @override
  Widget build(BuildContext context) {
    final posterpath =
        listOfVedioLaughLoudIherited.of(context)?.movieData.posterPath;
    final Url = vedioUrl[index % vedioUrl.length];
    return Stack(
      children: [
        VedioFastLaugh(
          vedioUrl: Url,
          onStateChanged: (bool) {},
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                child: Icon(Icons.volume_off),
                radius: 30,
                backgroundColor: Colors.black.withOpacity(0.5),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundImage: posterpath == null
                        ? null
                        : NetworkImage(
                            '$downloadAppendImage$posterpath',
                            //"https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                            // "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/20mOwAAPwZ1vLQkw0fvuQHiG7bO.jpg"
                            // 'https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          ),
                  ),
                  CircleavatarWidgetRight(
                    icon: Icons.emoji_emotions,
                    title: "LOL",
                  ),
                  CircleavatarWidgetRight(
                    icon: Icons.add,
                    title: "My List",
                  ),
                  GestureDetector(
                    onTap: () {
                      final movieName = listOfVedioLaughLoudIherited
                          .of(context)
                          ?.movieData
                          .title;
                      if (movieName != null) {
                        Share.share(movieName);
                      }
                    },
                    child: CircleavatarWidgetRight(
                      icon: Icons.share,
                      title: "Share",
                    ),
                  ),
                  CircleavatarWidgetRight(
                    icon: Icons.play_arrow,
                    title: "Play",
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CircleavatarWidgetRight extends StatelessWidget {
  CircleavatarWidgetRight({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(children: [
        CircleAvatar(
          child: Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          radius: 27,
          backgroundColor: Colors.transparent,
        ),
        Text(title),
      ]),
    );
  }
}

class VedioFastLaugh extends StatefulWidget {
  const VedioFastLaugh(
      {super.key, required this.vedioUrl, required this.onStateChanged});
  final String vedioUrl;
  final void Function(bool isPlaying) onStateChanged;
  @override
  State<VedioFastLaugh> createState() => _VedioFastLaughState();
}

class _VedioFastLaughState extends State<VedioFastLaugh> {
  late VideoPlayerController vedioPlayerCOntroller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: vedioPlayerCOntroller.value.isInitialized
            ? AspectRatio(
                aspectRatio: vedioPlayerCOntroller.value.aspectRatio,
                child: VideoPlayer(vedioPlayerCOntroller),
              )
            : const Center(
                child: Text("Loading"),
              ));
  }

  @override
  void initState() {
    vedioPlayerCOntroller = VideoPlayerController.network(widget.vedioUrl);
    vedioPlayerCOntroller.initialize().then((value) {
      setState(() {
        vedioPlayerCOntroller.play();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    vedioPlayerCOntroller.dispose();
    super.dispose();
  }
}
