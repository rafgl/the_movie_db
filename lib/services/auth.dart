import 'package:get/get.dart';
import 'package:the_movie_db/models/user_model.dart';
import 'package:the_movie_db/services/storage.dart';

class AuthService extends GetxService {
  Rx<UserModel?> _user = Rx<UserModel?>(null);
  UserModel? get user => _user.value;

  bool get authenticated => user != null;

  void setUserNull() {
    _user.value = null;
  }

  void getUserOffline() {
    String? email = StorageService.box.read('user') ?? 'null';
    if (email != 'null') {
      print("validou");
      _user.value = UserModel(email: email);
    }
  }

  setUserOffline(UserModel user) async {
    await StorageService.box.write('user', user.email!);
    _user.value = user;
  }
}
