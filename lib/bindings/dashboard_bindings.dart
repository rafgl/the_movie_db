import 'package:get/get.dart';
import 'package:the_movie_db/controllers/dashboard_controller.dart';
import 'package:the_movie_db/services/auth.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(
      DashboardController(
        authService: Get.find<AuthService>(),
      ),
    );
  }
}
