import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/application/search/search_bloc.dart';
import 'package:netflixapp/core/constants.dart';
import 'package:netflixapp/presentation/search/widgets/resultGridWidget.dart';

import 'package:netflixapp/presentation/search/widgets/searchidle.dart';

import '../../core/debounce/debounce.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  final _debouncer = Debouncer(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialized());
    });
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          CupertinoSearchTextField(
            onChanged: (value) {
              if (value.isEmpty) {
                return;
              }
              // BlocProvider.of<SearchBloc>(context)
              //     .add(SearchMovie(movieQuery: value));
              _debouncer.run(() {
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchMovie(movieQuery: value));
              });
            },
            padding: const EdgeInsets.all(10),
            style: TextStyle(color: Colors.white, fontSize: 25),
            backgroundColor: Color.fromARGB(255, 44, 43, 43),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.white,
            ),
          ),
          kheight,
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.SearchResultKey.isEmpty) {
                  return const SearchIdle();
                } else {
                  return const ResultGridWidget();
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
