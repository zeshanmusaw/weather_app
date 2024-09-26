import 'package:flutter/material.dart';

class HourlyWeatherWidget extends StatelessWidget {
  final List<dynamic> hourlyWeather;

  HourlyWeatherWidget({required this.hourlyWeather});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      //             height: 250,, // Adjust based on your UI
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyWeather.length,
        itemBuilder: (context, index) {
          final weather = hourlyWeather[index];
          return HourlyWeatherCard(
            time: weather['time'],
            temperature: weather['temp_c'],
            icon: weather['condition']['icon'],
            description: weather['condition']['text'],
          );
        },
      ),
    );
  }
}

class HourlyWeatherCard extends StatelessWidget {
  final String time;
  final double temperature;
  final String icon;
  final String description;

  HourlyWeatherCard({
    required this.time,
    required this.temperature,
    required this.icon,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: ClipPath(
                    child: Container(
                      width: 100,
                      height: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFFFFF)
                                .withOpacity(0.70), // Light blue color
                            Color(0xFFFFFFF)
                                .withOpacity(0.0), // Dark blue color
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        // Light border
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(80),
                          bottom: Radius.circular(80),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                          time.substring(11, 16), // Replace with current time
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'CircularStd',
                            ),
                          ),
                          SizedBox(height: 20),
                          Image.network(
                            'https:$icon', // Replace with your weather icon URL
                            width: 80,
                            height: 80,
                          ),

                          SizedBox(height: 10),
                          Text(
                              "$temperature°C", // Replace with actual temperature
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          // Text(time.substring(11, 16)), // Display hour and minutes
          // Image.network("https:$icon"), // Weather icon from API
          // Text("$temperature°C"),
          // Text(description),
        ],
      ),
    );
  }
}
