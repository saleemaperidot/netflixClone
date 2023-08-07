import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  final String heading;
  AppBarWidget(
      {super.key, required this.heading, this.FlagTextOrImage = false});
  bool FlagTextOrImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        FlagTextOrImage
            ? Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/f/ff/Netflix-new-icon.png"),
                        fit: BoxFit.cover)),
              )
            : Text(
                heading,
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: textAndIconColor,
        ),
        kwidth,
        Container(
          color: Colors.blue,
          width: 15,
          height: 15,
        ),
        kwidth
      ],
    );
  }
}
