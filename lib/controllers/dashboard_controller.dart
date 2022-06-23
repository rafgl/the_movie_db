import 'package:get/get.dart';

import 'package:the_movie_db/models/movie_model.dart';
import 'package:the_movie_db/repositories/get_movies_repository.dart';
import 'package:the_movie_db/services/auth.dart';

class DashboardController extends GetxController {
  final AuthService authService;

  DashboardController({required this.authService});

  GetAPIRepository personsRepository = GetAPIRepository();

  RxList<MoviesModel> movieRecent = RxList<MoviesModel>();
  RxList<MoviesModel> moviePopular = RxList<MoviesModel>();

  final _loading = RxBool(false);
  bool get loading => _loading.value;

  @override
  void onInit() async {
    super.onInit();
    _loading.value = true;

    await getMovieRecent();
    await getMoviePopular();

    _loading.value = false;
  }

  Future<void> getMovieRecent() async {
    List<MoviesModel> response = await personsRepository.getMoviesRecent();
    print('response $response');
    movieRecent.value = response;
  }

  Future<void> getMoviePopular() async {
    List<MoviesModel> response = await personsRepository.getMoviesPopular();
    print('response $response');
    moviePopular.value = response;
  }

  // getCharacter() async {
  //   List<CharacterModel> characters = await characterRepository.getCharacter();
  //   character.value = characters;
  // }

  // getCreator() async {
  //   List<CreatorModel> creators = await characterRepository.getCreator();
  //   creator.value = creators;
  // }

  // getComics() async {
  //   List<ComicsModel> comics = await characterRepository.getComics();
  //   comic.value = comics;
  //   print(comics);
  // }
}
