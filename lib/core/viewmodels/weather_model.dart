import 'package:flutter/cupertino.dart';
import 'package:myweatherapp/core/enums/viewstate.dart';
import 'package:myweatherapp/core/models/city.dart';
import 'package:myweatherapp/core/services/api.dart';
import 'package:myweatherapp/core/viewmodels/base_model.dart';
import 'package:myweatherapp/locator.dart';

class WeatherModel extends BaseModel {
  Api _api = locator<Api>();

  List<City> city;
  List<Map<String, dynamic>> consolidatedWeather;
  Image png;

  Future<List<Map<String, dynamic>>> fetchSearch(String input) async {
    setState(ViewState.Busy);
    try {
      city = await _api.getSearchResults(input);
      consolidatedWeather =
          await _api.getConsolidateWeather(city[0].woeid.toString());
    } catch (error) {
      return null;
    }
    setState(ViewState.Idle);
    return consolidatedWeather;
  }
}
