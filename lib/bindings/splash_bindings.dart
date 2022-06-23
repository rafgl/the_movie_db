import 'package:get/get.dart';
import 'package:the_movie_db/controllers/splash_controller.dart';
import 'package:the_movie_db/services/auth.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(
      SplashController(
        authService: Get.find<AuthService>(),
      ),
    );
  }
}
