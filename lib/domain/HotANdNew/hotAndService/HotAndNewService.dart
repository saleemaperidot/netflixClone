import 'package:dartz/dartz.dart';
import 'package:netflixapp/domain/HotANdNew/Models/hot_new/hot_new.dart';

import '../../core/failure/mainfailure.dart';

abstract class HotAndNewServices {
  Future<Either<MainFailure, List<HotNew>>> getHotnNewMovieResponse();
  Future<Either<MainFailure, List<HotNew>>> getHotnNewTvResponse();
}
