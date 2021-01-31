import 'package:flutter/material.dart';
import 'package:myweatherapp/core/enums/viewstate.dart';
import 'package:myweatherapp/core/viewmodels/weather_model.dart';
import 'package:myweatherapp/ui/views/base_view.dart';

class WeatherView extends StatelessWidget {
  String city = 'Johannesburg';
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return BaseView<WeatherModel>(
      onModelReady: (model) => model.fetchSearch(city),
      builder: (context, model, child) => Scaffold(
        body: model.state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/' +
                            model.consolidatedWeather[0]['weather_state_name']
                                .replaceAll(' ', '')
                                .toLowerCase() +
                            '.png'),
                        fit: BoxFit.cover)),
              child: model.consolidatedWeather[0]['weather_state_abbr'] == null
                  ? Center(child: CircularProgressIndicator())
                  : Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: [
                        Center(
                          child: Image.network(
                            'https://www.metaweather.com/static/img/weather/png/' +
                                model
                                    .consolidatedWeather[0]['weather_state_abbr'] +
                                '.png',
                            width: 100,
                          ),
                        ),
                        Center(
                          child: Text(
                            model.consolidatedWeather[0]['the_temp']
                                .round()
                                .toString() +
                                ' °C',
                            style: TextStyle(
                                color: Colors.white, fontSize: 60.0),
                          ),
                        ),
                          Center(
                            child: Text(
                              model.city[0].location,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 40.0),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                              width: 300,
                              child: TextField(
                                onSubmitted: (String input) {
                                  city = input;
                                  var list = model.fetchSearch(input);

                                  if (list == null) {
                                    errorMessage =
                                    "Sorry, we don't have data about this city. Please try another one";
                                  }
                                },
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                                decoration: InputDecoration(
                                    hintText: 'Search another city...',
                                    hintStyle: TextStyle(
                                        color: Colors.white, fontSize: 18.0),
                                    prefixIcon: Icon(Icons.search,
                                        color: Colors.white)),
                              ),
                          ),
                          Text(
                            errorMessage,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.red, fontSize: 18.0),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
