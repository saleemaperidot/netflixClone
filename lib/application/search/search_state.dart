part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState(
      {required List<Result> SearchResultKey,
      required List<downloadModel> idleList,
      required bool isLoading,
      required bool isError}) = _SearchState;
  factory SearchState.initial() => const SearchState(
        SearchResultKey: [],
        idleList: [],
        isLoading: false,
        isError: false,
      );
}
