import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixapp/application/fastLaugh/fast_laugh_bloc.dart';
import 'package:netflixapp/domain/HotANdNew/Models/hot_new/hot_new.dart';
import 'package:netflixapp/domain/HotANdNew/hotAndService/HotAndNewService.dart';

part 'hotn_new_event.dart';
part 'hotn_new_state.dart';
part 'hotn_new_bloc.freezed.dart';

@injectable
class HotnNewBloc extends Bloc<HotnNewEvent, HotnNewState> {
  final HotAndNewServices hotAndNewServices;
  HotnNewBloc(this.hotAndNewServices) : super(HotnNewState.initial()) {
    on<LoadDatainCommimgSoon>((event, emit) async {
      emit(const HotnNewState(
          HotnNewMovieList: [], TvShows: [], isLoading: true, hasError: false));
      final result = await hotAndNewServices.getHotnNewMovieResponse();
      print("hot n new print$result");
      final _state = result.fold((l) {
        return const HotnNewState(
            HotnNewMovieList: [],
            TvShows: [],
            isLoading: false,
            hasError: true);
      }, (r) {
        return HotnNewState(
          HotnNewMovieList: r,
          TvShows: state.TvShows,
          isLoading: false,
          hasError: false,
        );
      });
      emit(_state);
    });

    on<LoadDatainEveryonesWatching>((event, emit) {});
  }
}
