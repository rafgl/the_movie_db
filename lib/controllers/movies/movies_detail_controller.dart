import 'package:get/get.dart';
import 'package:the_movie_db/models/args/moviesArgs.dart';
import 'package:the_movie_db/models/movie_data_model.dart';
import 'package:the_movie_db/models/movie_model.dart';
import 'package:the_movie_db/repositories/get_movies_repository.dart';

class MoviesDetailController extends GetxController {
  GetAPIRepository homeRepository = GetAPIRepository();
  GetAPIRepository personsRepository = GetAPIRepository();

  MovieData movieData = MovieData();

  final RxBool _refreshCategory = RxBool(true);
  bool get refreshCategory => _refreshCategory.value;

  final RxBool _loading = RxBool(true);
  bool get loading => _loading.value;

  late final MovieArgs comicDetailsArgs;
  late final MoviesModel movie;

  @override
  void onInit() async {
    super.onInit();
    comicDetailsArgs = Get.arguments as MovieArgs;
    movie = comicDetailsArgs.movie!;
    await getMovieData();
  }

  Future<void> getMovieData() async {
    _loading.value = true;
    MovieData? response = await personsRepository.getMovieDataById(movie.id!);
    print('response $response');
    movieData = response!;
    _loading.value = false;
  }
}
