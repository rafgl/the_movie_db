import 'package:get/get.dart';
import 'package:the_movie_db/controllers/movies/movies_controller.dart';

class MoviesRecentBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MoviesRecentController>(
      MoviesRecentController(),
    );
  }
}
