part of 'hotn_new_bloc.dart';

@freezed
class HotnNewEvent with _$HotnNewEvent {
  const factory HotnNewEvent.loadDatainCommimgSoon() = LoadDatainCommimgSoon;
  const factory HotnNewEvent.loadDatainEveryonesWatching() =
      LoadDatainEveryonesWatching;
}
