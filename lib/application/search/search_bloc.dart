import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixapp/domain/core/failure/mainfailure.dart';
import 'package:netflixapp/domain/download/Models/downloadModel.dart';
import 'package:netflixapp/domain/download/repo/IDownloadRepo.dart';
import 'package:netflixapp/domain/search/models/search_r_esult/result.dart';
import 'package:netflixapp/domain/search/models/search_r_esult/search_r_esult.dart';
import 'package:netflixapp/domain/search/search_services.dart';
import 'package:netflixapp/presentation/search/widgets/searchidle.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IdownloadRepo _downloadServices;
  final SearchServices _searchQuery;
  SearchBloc(this._downloadServices, this._searchQuery)
      : super(SearchState.initial()) {
    //Idlestate
    on<Initialized>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
          SearchResultKey: [],
          idleList: state.idleList,
          isLoading: false,
          isError: false,
        ));
        return;
      }
      emit(const SearchState(
        SearchResultKey: [],
        idleList: [],
        isLoading: true,
        isError: true,
      ));
      //get trending
      final movieIdleReult = await _downloadServices.getDownloadsImage();
      log("search with tittle${movieIdleReult}");
      final _state = movieIdleReult.fold(
        (MainFailure f) {
          return const SearchState(
            SearchResultKey: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (List<downloadModel> listOfMovie) {
          return SearchState(
            SearchResultKey: [],
            idleList: listOfMovie,
            isLoading: false,
            isError: false,
          );
        },
      );
      //show to ui
      emit(_state);
    });
//search with query
    on<SearchMovie>((event, emit) async {
      //get movie api with query
      final searchQueryResult =
          await _searchQuery.searchMovie(movieQuery: event.movieQuery);
      print("serach result ${searchQueryResult}");
      final _state = searchQueryResult.fold(
        (MainFailure f) {
          return const SearchState(
            SearchResultKey: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (SearchREsult result) {
          return SearchState(
            SearchResultKey: result.results,
            idleList: [],
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(_state);
      //show to ui
    });
  }
}
