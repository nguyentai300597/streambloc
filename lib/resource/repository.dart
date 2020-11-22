
import 'package:flutter_app_new/model/item_model.dart';
import 'package:flutter_app_new/model/model_detail.dart';
import 'package:flutter_app_new/resource/movie_api_provider.dart';

class Repository {

  final movieApiProvider = MovieApiProvider();
  Future<ItemModel> fetchAllMovies() => movieApiProvider.fetchMovieList();
  Future<MovieDetailModel> fetchMovieDetail(int movieId) => movieApiProvider.fetchMovieDetail(movieId);
}
