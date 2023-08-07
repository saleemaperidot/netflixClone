import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixapp/domain/core/apiEndPoints.dart';
import 'package:netflixapp/domain/search/models/search_r_esult/result.dart';
import 'package:netflixapp/domain/search/models/search_r_esult/search_r_esult.dart';
import 'package:netflixapp/domain/core/failure/mainfailure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflixapp/domain/search/search_services.dart';

@LazySingleton(as: SearchServices)
class SearchRepository implements SearchServices {
  @override
  Future<Either<MainFailure, SearchREsult>> searchMovie(
      {required String movieQuery}) async {
    try {
      final response = await Dio(BaseOptions())
          .get(ApiEmdPoints.searchKey, queryParameters: {'query': movieQuery});
      //  print(response.data.toString());
      //  return right(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final searchResultkey = SearchREsult.fromJson(response.data);

        return Right(searchResultkey);
      } else {
        return const Left(MainFailure.ServerFailure());
      }
    } catch (_) {
      return const Left(MainFailure.ClientFailure());
    }
  }
}
