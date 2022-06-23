import 'package:get/get.dart';
import 'package:the_movie_db/controllers/movies/movies_detail_controller.dart';

class MoviesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MoviesDetailController>(
      MoviesDetailController(),
    );
  }
}
