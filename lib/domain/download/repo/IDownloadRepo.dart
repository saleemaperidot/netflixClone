// ignore: file_names
// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:netflixapp/domain/core/failure/mainfailure.dart';
import 'package:netflixapp/domain/download/Models/downloadModel.dart';
//import 'package:netflixapp/presentation/downloads/Models/downloadModel.dart';

abstract class IdownloadRepo {
  Future<Either<MainFailure, List<downloadModel>>> getDownloadsImage();
}
