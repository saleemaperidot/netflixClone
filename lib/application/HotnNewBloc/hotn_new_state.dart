part of 'hotn_new_bloc.dart';

@freezed
class HotnNewState with _$HotnNewState {
  const factory HotnNewState({
    required List<HotNew> HotnNewMovieList,
    required List<HotNew> TvShows,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;
  factory HotnNewState.initial() => const HotnNewState(
      HotnNewMovieList: [], TvShows: [], isLoading: false, hasError: false);
}
