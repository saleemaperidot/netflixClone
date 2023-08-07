import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflixapp/application/HotnNewBloc/hotn_new_bloc.dart';
import 'package:netflixapp/core/colors/colors.dart';
import 'package:netflixapp/core/constants.dart';
import 'package:netflixapp/core/urlStrings.dart';
import 'package:netflixapp/presentation/newAndHot/commingSoon.dart';
import 'package:netflixapp/presentation/newAndHot/everyonesWatching.dart';
import 'package:netflixapp/presentation/widget/app_bar_widgget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            title: Text(
              "Hot & New",
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: textAndIconColor,
              ),
              kwidth,
              Container(
                //color: Colors.blue,
                width: 15,
                height: 15,
              ),
              kwidth
            ],
            bottom: TabBar(
                isScrollable: true,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                tabs: const [
                  Tab(
                    text: "🍿 comming soon",
                  ),
                  Tab(
                    text: "👀 everyones watching",
                  )
                ]),
          ),
        ),
        body: TabBarView(
          children: [
            const CommigSoonWidget(),
            _tabViewEveyonesWatching(),
          ],
        ),
      ),
    );
  }

  // Widget _tabviewCommingSoon() {
  //   return ListView.builder(
  //       itemCount: 10,
  //       itemBuilder: (context, index) => const commingSoonWidget());
  // }

  Widget _tabViewEveyonesWatching() {
    return BlocBuilder<HotnNewBloc, HotnNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          return const Center(child: Text("Error while loading image"));
        } else if (state.HotnNewMovieList.isEmpty) {
          return const Center(
              child: Text("Error while loading image list is empty"));
        } else {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: state.HotnNewMovieList.length,
            itemBuilder: (context, index) {
              final movie = state.HotnNewMovieList[index];
              if (movie.id == null) {
                return const SizedBox();
              }
              print(movie.releaseDate);
              final _date = DateTime.parse(movie.releaseDate!);
              final formatdate = DateFormat.yMMMMd('en_US').format(_date);
              print(formatdate);
              //return const SizedBox();
              return everyonesWaching(
                discription: movie.overview ?? "no Review",
                movieName: movie.originalTitle ?? "no tittle",
                posterPath: '$downloadAppendImage${movie.backdropPath}',
              );
            },
          );
        }
      },
    );
  }
}

class CommigSoonWidget extends StatelessWidget {
  const CommigSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotnNewBloc>(context).add(const LoadDatainCommimgSoon());
    });
    return BlocBuilder<HotnNewBloc, HotnNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          return const Center(child: Text("Error while loading image"));
        } else if (state.HotnNewMovieList.isEmpty) {
          return const Center(
              child: Text("Error while loading image list is empty"));
        } else {
          return ListView.builder(
              itemCount: state.HotnNewMovieList.length,
              itemBuilder: (context, index) {
                final movie = state.HotnNewMovieList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                print(movie.releaseDate);
                final _date = DateTime.parse(movie.releaseDate!);
                final formatdate = DateFormat.yMMMMd('en_US').format(_date);
                print(formatdate);
                return commingSoonWidget(
                  id: movie.id!,
                  month:
                      formatdate.split(' ').first.substring(0, 3).toUpperCase(),
                  day: movie.releaseDate!.split('-')[1],
                  posterPath: '$downloadAppendImage${movie.posterPath}',
                  movieName: movie.originalTitle ?? "No title",
                  discription: movie.overview ?? "No Reviews",
                );
              });
        }
      },
    );
  }
}
