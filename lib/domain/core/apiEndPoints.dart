import 'package:netflixapp/core/urlStrings.dart';
import 'package:netflixapp/infrstructure/api_key.dart';

class ApiEmdPoints {
  static const downloadImages =
      "$baseUrlOfTMDB/trending/all/day?api_key=$apiKey";
  static const searchKey = "$baseUrlOfTMDB/search/movie?api_key=$apiKey";

  static const hotNnewTvUrl = "$baseUrlOfTMDB/3/discover/tv?api_key=$apiKey";
  static const hotNnewMovieUrl =
      "https://api.themoviedb.org/3/discover/movie?api_key=6992b81e714791d9e0c46a43aadd8fba#";
  //"$baseUrlOfTMDB/3/discover/movie?api_key=$apiKey";
}

// https://api.themoviedb.org/3/search/movie?api_key=6992b81e714791d9e0c46a43aadd8fba