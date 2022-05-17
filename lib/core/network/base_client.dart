import 'package:bloctest/core/constants/api_endpoints.dart';
import 'package:bloctest/injector.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BlocBaseClient {
  //get request
  Future<http.Response?> getRequest({
    String baseUrl = ApiEndpoints.baseUrl,
    required String path,
    bool shouldCache = false,
  }) async {
    http.Response? response;
    try {
      List<int> successStatusCode = [200, 201, 202];
      response = await http.get(Uri.parse(baseUrl + path));
      if (successStatusCode.contains(response.statusCode) && shouldCache) {
        locator<SharedPreferences>().setString(path, response.body);
      }
    } catch (e) {
      String? cacheResponse = locator<SharedPreferences>().getString(path);
      if (cacheResponse != null) {
        response = http.Response(cacheResponse, 200);
      }
    }
    return response;
  }
}
