import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixapp/domain/core/apiEndPoints.dart';
import 'package:netflixapp/domain/download/Models/downloadModel.dart';
import 'package:netflixapp/domain/core/failure/mainfailure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflixapp/domain/download/repo/IDownloadRepo.dart';

@LazySingleton(as: IdownloadRepo)
class DownloadRepository implements IdownloadRepo {
  @override
  Future<Either<MainFailure, List<downloadModel>>> getDownloadsImage() async {
    try {
      final response =
          await Dio(BaseOptions()).get(ApiEmdPoints.downloadImages);
      print(response.data.toString());
      //  return right(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadImageList = (response.data['results'] as List)
            .map((e) => downloadModel.fromJson(e))
            .toList();
        //final List<downloadModel> downloadImageList = [];
        log(response.data.toString());

        return Right(downloadImageList);
      } else {
        return const Left(MainFailure.ServerFailure());
      }
    } catch (_) {
      return const Left(MainFailure.ClientFailure());
    }
  }
}
