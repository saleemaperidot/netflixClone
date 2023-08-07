import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixapp/domain/download/Models/downloadModel.dart';
import 'package:netflixapp/domain/download/repo/IDownloadRepo.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final vedioUrl = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
];

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IdownloadRepo _dowloadServises,
  ) : super(FastLaughState.initial()) {
    on<Initilized>((event, emit) async {
      // send Loading to ui
      emit(const FastLaughState(
          fastLaughImage: [],
          isLoading: true,
          isError: false,
          unLikedVedios: [],
          likedVedios: []));
      //get trending ,movies
      final result = await _dowloadServises.getDownloadsImage();
      final _state = result.fold((l) {
        return FastLaughState(
            fastLaughImage: [],
            isLoading: false,
            isError: true,
            likedVedios: state.likedVedios,
            unLikedVedios: state.unLikedVedios);
      }, (r) {
        return FastLaughState(
            fastLaughImage: r,
            isLoading: false,
            isError: false,
            likedVedios: state.likedVedios,
            unLikedVedios: state.unLikedVedios);
      });
      emit(_state);
      //show it to ui
    });
    on<Liked>((event, emit) async {
      state.likedVedios.add(event.liked);
      emit(state.copyWith(likedVedios: state.likedVedios));
    });
    on<UnLiked>((event, emit) async {
      state.likedVedios.remove(event.liked);
      emit(state.copyWith(likedVedios: state.likedVedios));
    });
  }
}
