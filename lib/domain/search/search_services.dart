import 'package:dartz/dartz.dart';
import 'package:netflixapp/domain/core/failure/mainfailure.dart';
import 'package:netflixapp/domain/search/models/search_r_esult/result.dart';
import 'package:netflixapp/domain/search/models/search_r_esult/search_r_esult.dart';

abstract class SearchServices {
  Future<Either<MainFailure, SearchREsult>> searchMovie(
      {required String movieQuery});
}
