import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflixapp/domain/core/failure/mainfailure.dart';
import 'package:netflixapp/domain/download/Models/downloadModel.dart';
import 'package:netflixapp/domain/download/repo/IDownloadRepo.dart';
part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IdownloadRepo _downloadRepo;
  DownloadsBloc(this._downloadRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImage>((event, emit) async {
      // TODO: implement event handler
      emit(state.copyWith(
        isLoading: true,
        failureorsuccesdownloads: none(),
      ));
      final Either<MainFailure, List<downloadModel>> downloadOptions =
          await _downloadRepo.getDownloadsImage();
      print(downloadOptions.toString());
      emit(downloadOptions.fold(
          (l) => state.copyWith(
              isLoading: false, failureorsuccesdownloads: some(left(l))),
          (r) => state.copyWith(
              isLoading: false,
              downloadImage: r,
              failureorsuccesdownloads: some(right(r)))));
      //print(r);
    });
  }
}
