import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixapp/core/constants.dart';

class everyonesWaching extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String discription;

  const everyonesWaching(
      {super.key,
      required this.posterPath,
      required this.movieName,
      required this.discription});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheight,
        const Text(
          "Friends",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
        Text(
          discription,
          //   "Friends is an America 1994, to May 6, 2004, lasting ten seasons.[1] With an ensemble cast starring Jennifer Aniston, Courteney Cox, Lisa Kudrow, Matt LeBlanc, Matthew Perry and David Schwimmer, the show revolves around six friends in their 20s and 30s",
          style: TextStyle(color: Colors.grey),
        ),
        kheight,
        kheight,
        Stack(
          children: [
            Container(
              height: 250,
              //color: Colors.grey,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(posterPath),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Positioned(
              right: 10,
              bottom: 10,
              child: Icon(
                Icons.volume_mute_rounded,
                color: Colors.white,
              ),
            )
          ],
        ),
        ListTile(
          contentPadding: EdgeInsets.all(5),
          trailing: Padding(
            padding: EdgeInsets.all(3),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      Text("Share")
                    ],
                  ),
                ),
                kwidth,
                Container(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Text("My List"),
                    ],
                  ),
                ),
                kwidth,
                Container(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                      Text("Play"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          leading: Text(
            movieName,
            style: GoogleFonts.abel(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
