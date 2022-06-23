import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:the_movie_db/services/auth.dart';
import 'package:the_movie_db/utils/routes.dart';

class SplashController extends GetxController {
  final AuthService authService;

  SplashController({required this.authService});

  @override
  onInit() async {
    super.onInit();
    await Firebase.initializeApp();
    FirebaseAuth.instance.setLanguageCode('pt-BR');
  }

  @override
  void onReady() async {
    super.onReady();
    print("SplashController");
    Future.delayed(Duration(milliseconds: 2000), () async {
      authService.getUserOffline();
      authService.authenticated
          ? Get.offNamed(Routes.dashboard)
          : Get.offNamed(Routes.login);
    });
  }
}
