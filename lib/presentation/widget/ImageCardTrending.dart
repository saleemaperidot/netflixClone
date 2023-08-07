import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImageCardTrending extends StatelessWidget {
  ImageCardTrending({super.key, required this.index});
  final index;
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              width: 30,
              height: 150,
            ),
            Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      scale: 1.5,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://img.freepik.com/premium-photo/deeply-entertained-horizontal-portrait-young-man-watching-movie-attentively-with-his-mouth-open_54255-66.jpg?w=996"))),
            )
          ],
        ),
        Positioned(
          bottom: 0,
          left: 20,
          child: BorderedText(
            strokeWidth: 3,
            strokeColor: Colors.white,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                decoration: TextDecoration.none,
                decorationColor: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
