import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:the_movie_db/services/storage.dart';
import 'package:the_movie_db/utils/config.dart';

class HttpService extends GetConnect {
  @override
  void onInit() {
    super.onInit();

    httpClient.baseUrl = Config.BASE_URL;
    // httpClient.followRedirects = false;
    httpClient.timeout = const Duration(seconds: 20);

    httpClient.maxAuthRetries = 2;

    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';

      String? accessToken = StorageService.box.read(Config.ACCESS_TOKEN);

      if (null != accessToken) {
        request.headers['Authorization'] = 'Bearer $accessToken';
      }

      return request;
    });

    httpClient.addAuthenticator((Request request) {
      return request;
    });
  }
}
