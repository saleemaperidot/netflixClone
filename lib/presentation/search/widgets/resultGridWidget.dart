import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/application/search/search_bloc.dart';
import 'package:netflixapp/core/constants.dart';
import 'package:netflixapp/core/urlStrings.dart';
import 'package:netflixapp/presentation/search/tittile.dart';

class ResultGridWidget extends StatelessWidget {
  const ResultGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tittle(title: "Movies & Tv"),
        kheight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.4,
                  children: List.generate(
                    20,
                    (index) {
                      final movie = state.SearchResultKey[index];
                      //final q = searchKey;
                      return MainMovieGridCard(
                        imageUrl: '$downloadAppendImage${movie.posterPath}',
                      );
                    },
                  ));
            },
          ),
        )
      ],
    );
  }
}

class MainMovieGridCard extends StatelessWidget {
  const MainMovieGridCard({super.key, required this.imageUrl});
  final imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageUrl
                    // "https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    ))),
      ),
    );
  }
}
