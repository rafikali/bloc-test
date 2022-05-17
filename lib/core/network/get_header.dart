import 'package:bloctest/core/constants/app_constants.dart';
import 'package:bloctest/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, String> getHeader() {
  String? accessToken =
      locator<SharedPreferences>().getString(AppConstants.accessToken);
  return {
    "Content-Type": "application/json",
    "Accept": "application/json",
    if (accessToken != null) "Authorization": "Bearer $accessToken"
  };
}
