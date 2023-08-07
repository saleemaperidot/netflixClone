import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixapp/domain/HotANdNew/Models/hot_new/hot_new.dart';
import 'package:dartz/dartz.dart';
import 'package:netflixapp/domain/HotANdNew/hotAndService/HotAndNewService.dart';
import 'package:netflixapp/domain/core/failure/mainfailure.dart';

import '../../domain/core/apiEndPoints.dart';

@LazySingleton(as: HotAndNewServices)
class HotnNewImplimentation implements HotAndNewServices {
  @override
  Future<Either<MainFailure, List<HotNew>>> getHotnNewMovieResponse() async {
    log("eendootaa");
    try {
      // print(ApiEmdPoints.hotNnewMovieUrl);
      final response = await Dio(BaseOptions()).get(
        ApiEmdPoints.hotNnewMovieUrl,
      );
      print(response.data.toString());
      //  return right(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // final HotAndNewMovieResults = HotNew.fromJson(response.data);
        final HotAndNewMovieResults = (response.data['results'] as List)
            .map((e) => HotNew.fromJson(e))
            .toList();
        return Right(HotAndNewMovieResults);
        } else {
          return const Left(MainFailure.ServerFailure());
        }
    } catch (_) {
      return const Left(MainFailure.ClientFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<HotNew>>> getHotnNewTvResponse() async {
    try {
      final response = await Dio(BaseOptions()).get(
        ApiEmdPoints.hotNnewTvUrl,
      );
      //  print(response.data.toString());
      //  return right(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        //   final hotAndNewTvResults = HotNew.fromJson(response.data);
        final hotAndNewTvResults = (response.data['results'] as List)
            .map((e) => HotNew.fromJson(e))
            .toList();
        return Right(hotAndNewTvResults);
      } else {
        return const Left(MainFailure.ServerFailure());
      }
    } catch (_) {
      return const Left(MainFailure.ClientFailure());
    }
  }
}
