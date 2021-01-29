import 'package:get_it/get_it.dart';
import 'package:myweatherapp/core/services/api.dart';
import 'package:myweatherapp/core/viewmodels/weather_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => WeatherModel());
  locator.registerLazySingleton(() => Api());
}
