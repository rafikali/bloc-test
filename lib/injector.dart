import 'package:bloctest/core/network/base_client.dart';
import 'package:bloctest/features/home/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final SharedPreferences _prefs = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(_prefs);
  locator.registerFactory(() => BlocBaseClient());
  locator.registerFactory(() => HomeRepo(locator()));
}
