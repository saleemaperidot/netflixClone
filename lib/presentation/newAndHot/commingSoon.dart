import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixapp/core/constants.dart';

class commingSoonWidget extends StatelessWidget {
  final int id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String discription;

  const commingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.discription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      //  color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                // width: 40,
                // color: Colors.blue,
                child: Text(
                  '$month $day',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              )),
          Expanded(
            flex: 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      //    color: Colors.grey,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(posterPath
                                //"https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                )),
                      ),
                    ),
                    const Positioned(
                      bottom: 0,
                      right: 0,
                      child: Icon(
                        Icons.volume_off,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                kheight,
                ListTile(
                    contentPadding: const EdgeInsets.all(-2),
                    leading: Text(
                      movieName,
                      style: GoogleFonts.kalam(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          children: const [
                            Icon(
                              Icons.notifications_none_outlined,
                              color: Colors.white,
                            ),
                            Text("Remind me")
                          ],
                        ),
                        kwidth,
                        Column(
                          children: const [
                            Icon(
                              Icons.info_outlined,
                              color: Colors.white,
                            ),
                            Text("Info")
                          ],
                        ),
                        kwidth,
                      ],
                    )

                    // height: 50,
                    //color: Colors.pink,

                    ),
                Container(
                  // color: Colors.green,
                  height: 20,
                  child: Text(
                    'Comming 0n friday${day + month}',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  height: 40,
                  color: Colors.black,
                  child: Row(
                    children: [
                      Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/f/ff/Netflix-new-icon.png",
                        width: 15,
                        height: 15,
                      ),
                      const Text(
                        "FILIM",
                        style: TextStyle(letterSpacing: 3, fontSize: 7),
                      )
                    ],
                  ),
                ),
                Text(
                  movieName,
                  style: TextStyle(fontSize: 20),
                ),
                kheight,

                // color: Colors.green,
                Text(
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      height: 1.3,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    discription
                    // overflow: TextOverflow.ellipsis,
                    // "The relationship between Jodi and Dunkleman begins on a lovely note, with the two sharing romantic moments. Jodi has become one of the popular kids at school as a result of her speech at the Homecoming dance, Tall Girl 2 is a 2022 American teen romantic comedy film directed by Emily Ting from a screenplay by Sam Wolfson. The film stars Ava Michelle"
                    ),
              ],
              // color: Colors.yellow,
            ),
          )
        ],
      ),
    );
  }
}
