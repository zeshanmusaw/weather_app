import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/service/location_service.dart';
import 'HourlyWeather/HourlyWeatherWidget.dart';
import 'service/weather_service.dart';

class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}


class _WeatherHomeScreenState extends State<WeatherHomeScreen> {

  Map<String, dynamic>? weatherData;
  List<dynamic> hourlyWeather = [];

  int _currentDayIndex = 0; // To track which set of three days to display
  bool _isCelsius = true;

  @override
  void initState() {
    super.initState();
    LocationService().checkLocationPermission();
    loadWeatherData();


  }
  // Load the weather data
  void loadWeatherData() async {
    try {
      final data = await WeatherService().fetchWeatherData();
      setState(() {
        weatherData = data;

         hourlyWeather = weatherData!['forecast']['forecastday'][0]['hour'];



      });
    } catch (error) {
      print('Error fetching weather data: $error');
    }
  }// Function to get the next three days data
  List<Map<String, dynamic>>? getNextThreeDays() {
    if (weatherData == null || weatherData!['forecast']['forecastday'].length < 3) {
      return null;
    }

    List<Map<String, dynamic>> forecastDays = [];
    for (int i = _currentDayIndex; i < _currentDayIndex + 3; i++) {
      if (i < weatherData!['forecast']['forecastday'].length) {
        forecastDays.add(weatherData!['forecast']['forecastday'][i]);

      }
    }
    return forecastDays;
  }
// Function to convert Celsius to Fahrenheit
  double convertToFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }
  void _showNextDays() {
    setState(() {
      _currentDayIndex += 3; // Move to the next set of three days
      if (_currentDayIndex >
          weatherData!['forecast']['forecastday'].length - 3) {
        _currentDayIndex = weatherData!['forecast']['forecastday'].length -
            3; // Prevent out of bounds
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: weatherData == null ?
      Center(child: CircularProgressIndicator()) :
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 50),

            // Temperature unit toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Celsius'),
                Switch(
                  value: _isCelsius,
                  onChanged: (value) {
                    setState(() {
                      _isCelsius = value; // Toggle the unit
                    });
                  },
                ),
                Text('Fahrenheit'),
              ],
            ),
            // Slider Section for the next three days

            // Add weather section widgets here
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft, // Start at the top-left corner
                  end: Alignment.bottomRight, // End at the bottom-right corner
                  colors: [
                    Color(0xFF97ABFF), // Light blue color
                    Color(0xFF123597), // Dark blue color
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  Text(
                    '${weatherData!['location']['country']}',
                    style: GoogleFonts.inter(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //font-family: Circular Std;

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/location.svg', // Path to your SVG file
                        height: 20.0, // Set the desired height
                        width: 20.0, // Set the desired width
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${weatherData!['location']['name']}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200, // Set height for the slider
                    child: PageView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final dayData = getNextThreeDays()![index];
                        return   Column(
                          children: [
                        Text(
                                dayData['date'],
                                style: TextStyle(fontSize: 20,    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 150,
                                    height: 130,
                                    child:
                                    Image.network(
                                        'https:${dayData['day']['condition']['icon']}')),
                                //  Image.asset('assets/images/partly_cloudy 1.png')),

                                Text(
                                  '${_isCelsius ? '${dayData['day']['maxtemp_c']}' :'${dayData['day']['maxtemp_f']}'} °${_isCelsius ? 'C' : 'F'}',


                                  //  '${dayData['day']['maxtemp_c']} °C',
                                  style: TextStyle(
                                      fontSize: 80,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        );

                      },
                    ),
                  ),


                  Text(
                    '${weatherData!['current']['condition']['text']} - ${weatherData!['current']['wind_kph']} km/h, ${weatherData!['current']['humidity']}%',
                    style: TextStyle(
                        fontFamily: 'CircularStd',
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  Text(
                    'Humidity: ${weatherData!['current']['humidity']}% , ${weatherData!['current']['pressure_mb']} mb',
                    style: TextStyle(
                        fontFamily: 'CircularStd',
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Add your onPressed code here!
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(30), // Rounded corners
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            backgroundColor: Color(0xFFFFFFF)
                                .withOpacity(0.10 )
                            // Background color
                            ),
                        child: Text(
                          'Today',

                          style: TextStyle(color: Colors.white,
                            fontFamily: 'CircularStd',), // Text color
                        ),
                      ),
                      SizedBox(width: 20), // Spacing between buttons
                      // Second Button
                      ElevatedButton(
                        onPressed: () {
                          // Add your onPressed code here!

_showNextDays();

                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30), // Rounded corners
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          backgroundColor: Color(0xFF000000).withOpacity(0.10),
                          // Background color
                        ),
                        child: Text(
                          'Next Days',
                          style: TextStyle(color:
                            Colors.white,
                            fontFamily: 'CircularStd',
                              ) // Text color
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                HourlyWeatherWidget(hourlyWeather: hourlyWeather),
                  Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFFFFF).withOpacity(0.8), // Light blue color
                          Color(0xFFFFFFF).withOpacity(0.0), // Dark blue color
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/sun-fog.png', // Replace with your weather icon URL
                          width: 80,
                          height: 80,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Sunset', // Replace with current time
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              weatherData!['forecast']['forecastday'][0]['astro']['sunset'], // Replace with current time
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sunrise', // Replace with current time
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                                weatherData!['forecast']['forecastday'][0]['astro']['sunrise'], // Replace with current time
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFFFFF)
                              .withOpacity(0.80), // Light blue color
                          Color(0xFFFFFFF).withOpacity(0.0), // Dark blue color
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/sun.png', // Replace with your weather icon URL
                          width: 80,
                          height: 80,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'UV Index',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              weatherData!['current']['uv'].toString(),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
