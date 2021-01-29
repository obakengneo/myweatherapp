import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myweatherapp/core/models/city.dart';

class Api {
  static const baseUrl = 'https://www.metaweather.com/api/location';

  var client = new http.Client();

  Future<List<City>> getSearchResults(String city) async {
    var cities = List<City>();
    var response = await client.get('$baseUrl/search/?query=$city');
    var parsed = json.decode(response.body) as List<dynamic>;

    for (var place in parsed) {
      cities.add(City.fromJson(place));
    }

    return cities;
  }

  Future<List<Map<String, dynamic>>> getConsolidateWeather(String woeid) async {
    var response = await client.get('$baseUrl/$woeid');

    if (response.statusCode != 200) return null;

    return List<Map<String, dynamic>>.from(
        json.decode(response.body)['consolidated_weather']);
  }
}
