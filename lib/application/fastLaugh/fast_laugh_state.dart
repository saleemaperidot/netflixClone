part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughState with _$FastLaughState {
  const factory FastLaughState(
      {required List<int> likedVedios,
      required List<int> unLikedVedios,
      required List<downloadModel> fastLaughImage,
      required bool isLoading,
      required bool isError}) = _Initial;
  factory FastLaughState.initial() => const FastLaughState(
      fastLaughImage: [],
      isLoading: true,
      isError: false,
      likedVedios: [],
      unLikedVedios: []);
}
