part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughEvent with _$FastLaughEvent {
  const factory FastLaughEvent.initilized() = Initilized;
  const factory FastLaughEvent.liked({required int liked}) = Liked;
  const factory FastLaughEvent.unLiked({required int liked}) = UnLiked;
}
