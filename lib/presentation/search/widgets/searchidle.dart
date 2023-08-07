import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/application/search/search_bloc.dart';
import 'package:netflixapp/core/constants.dart';
import 'package:netflixapp/core/urlStrings.dart';
import 'package:netflixapp/presentation/search/tittile.dart';
import 'package:netflixapp/presentation/widget/imageCardWidget.dart';

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      kheight,
      tittle(title: "Top Searches"),
      kheight,
      BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            return const Center(
              child: Text("Error in loading image"),
            );
          } else if (state.idleList.isEmpty) {
            return const Center(
              child: Text("No image list is empty"),
            );
          } else {
            return Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final movie = state.idleList[index];
                  return searchResultListTile(
                    title: movie.title ?? "No tittle Provided",
                    imageUrl: '$downloadAppendImage${movie.posterPath}',
                  );
                },
                separatorBuilder: (context, index) => kheight20,
                itemCount: state.idleList.length,
              ),
            );
          }
        },
      ),
    ]);
  }
}

class searchResultListTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const searchResultListTile(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        ImageCardWidget(
          imageUrl: imageUrl,
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        // Icon(Icons.play_circle_outline),
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 23,
              child: Icon(
                CupertinoIcons.play_fill,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}
