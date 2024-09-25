import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = 'dad524f767154937965110921242509';

  Future<Map<String, dynamic>> fetchCurrentWeather(
      double lat, double lon) async {
    final response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<Map<String, dynamic>> fetchWeatherForecast(
      double lat, double lon) async {
    final response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load forecast data');
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