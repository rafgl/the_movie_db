// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:the_movie_db/models/movie_data_model.dart';

import 'package:the_movie_db/models/movie_model.dart';
import 'package:the_movie_db/services/http.dart';
import 'package:the_movie_db/utils/config.dart';

class GetAPIRepository {
  final HttpService _httpProvider = Get.find<HttpService>();

  Future<List<MoviesModel>> getMoviesRecent() async {
    try {
      final response = await _httpProvider
          .get('/movie/now_playing?api_key=${Config.API_KEY}');
      final data = response.body['results'];
      print(data);
      return List.from(data).map((e) => MoviesModel.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<MoviesModel>> getMoviesPopular() async {
    try {
      final response =
          await _httpProvider.get('/movie/popular?api_key=${Config.API_KEY}');
      final data = response.body['results'];
      print(data);
      return List.from(data).map((e) => MoviesModel.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<MovieData?> getMovieDataById(int id) async {
    try {
      final response =
          await _httpProvider.get('/movie/$id?api_key=${Config.API_KEY}');

      return MovieData.fromJson(response.body);
    } catch (e) {
      return null;
    }
  }
}
