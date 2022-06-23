import 'package:get/get.dart';
import 'package:the_movie_db/controllers/login_controller.dart';
import 'package:the_movie_db/services/auth.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(
      LoginController(
        authService: Get.find<AuthService>(),
      ),
    );
  }
}
