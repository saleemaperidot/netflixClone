part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    required bool isLoading,
    required List<downloadModel> downloadImage,
    required Option<Either<MainFailure, List<downloadModel>>>
        failureorsuccesdownloads,
  }) = _DownloadsState;

  factory DownloadsState.initial() {
    return const DownloadsState(
      isLoading: false,
      failureorsuccesdownloads: None(),
      downloadImage: [],
    );
  }
}
