import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'location_service.dart';

class WeatherService {
  final String apiKey = '7cb90217e3544d65875130728242509';


// Function to fetch weather data
  Future<Map<String, dynamic>> fetchWeatherData() async {
    // Get the user's current location (latitude and longitude)
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    // Build the API URL with the location and API key
   final url = 'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=${position.latitude},${position.longitude}&aqi=no&days=3';
print("GET URL "+url);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {

print("Testing"+response.body.toString());
      return json.decode(response.body);

    } else {
      throw Exception('Failed to load weather data');
    }
  }

// get
  Future<Map<String, dynamic>> getWeatherData(String location) async {
    final url = Uri.parse('http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$location&days=3');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print('sussesee');
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

// Fetch 3-day weather forecast
Future<List<dynamic>> get3DayForecast(double lat, double lon) async {
  final url = 'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    // Filter the list to get daily forecasts, assuming API returns data for every 3 hours
    List<dynamic> dailyForecasts = [];
    for (var i = 0; i < data['list'].length; i += 8) {
      dailyForecasts.add(data['list'][i]);
    }
    return dailyForecasts.take(3).toList(); // Only return next 3 days
  } else {
    throw Exception('Failed to load forecast data');
  }
}
}