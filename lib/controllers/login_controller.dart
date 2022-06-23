import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_movie_db/models/user_model.dart';
import 'package:the_movie_db/services/auth.dart';
import 'package:the_movie_db/services/storage.dart';
import 'package:the_movie_db/utils/config.dart';
import 'package:the_movie_db/utils/routes.dart';

class LoginController extends GetxController {
  final AuthService authService;

  LoginController({required this.authService});
  final keyLoader = GlobalKey<FormState>();
  RxBool _loading = RxBool(false);
  RxBool checkBoxValue = RxBool(true);

  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

  late String? kindOfUser;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> loginWithGoogle() async {
    print("entrou");
    loading = true;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      await StorageService.box.write(Config.ACCESS_TOKEN, googleUser!.id);

      UserModel user = UserModel();
      user.email = googleUser.email;

      authService.setUserOffline(user);

      Get.offAllNamed(Routes.dashboard);
    } catch (e) {
      loading = false;
      print('error: $e');
    }
  }
}
