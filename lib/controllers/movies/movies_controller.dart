import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie_db/models/movie_model.dart';
import 'package:the_movie_db/repositories/get_movies_repository.dart';

class MoviesRecentController extends GetxController {
  RxList<MoviesModel> movieRecent = RxList<MoviesModel>();
  GetAPIRepository personsRepository = GetAPIRepository();

  final RxBool _refreshCategory = RxBool(true);
  bool get refreshCategory => _refreshCategory.value;

  final RxBool _loading = RxBool(true);
  bool get loading => _loading.value;

  final TextEditingController _filterSearch = TextEditingController();
  TextEditingController get filterSearch => _filterSearch;

  @override
  void onInit() async {
    super.onInit();

    await getMovieRecent();
  }

  Future<void> getMovieRecent() async {
    List<MoviesModel> response = await personsRepository.getMoviesRecent();
    print('response $response');
    movieRecent.value = response;
  }

  // getComicsForTitle(String title) async {
  //   List<ComicsModel> comics = await personsRepository.getComicsForTitle(title);

  //   if (comics.length == 0) {
  //     Fluttertoast.showToast(
  //         backgroundColor: MyColors.error, msg: "Não encontrado este comic");
  //   }
  //   comic.value = comics;
  // }
}
