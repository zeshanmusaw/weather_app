import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,

        child: Column(
          children: [
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
                    "INDIA",
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
                        'Current Location',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 140,
                          height: 130,
                          child:
                              Image.asset('assets/images/partly_cloudy 1.png')),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "13\u00B0",
                        style: TextStyle(
                            fontSize: 122,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Text(
                    "Partly Cloud - H:17\u00B0 L:4\u00B0",
                    style: TextStyle(
                        fontFamily: 'CircularStd',
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
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
                                    'Now', // Replace with current time
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'CircularStd',
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Image.asset(
                                    'assets/images/partly_cloudy 1.png', // Replace with your weather icon URL
                                    width: 80,
                                    height: 80,
                                  ),

                                  SizedBox(height: 10),
                                  Text(
                                    '25\u00B0C', // Replace with actual temperature
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
                        Padding(
                          padding:  EdgeInsets.symmetric(
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
                                    '4PM', // Replace with current time
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Image.asset(
                                    'assets/images/partly_cloudy 1.png', // Replace with your weather icon URL
                                    width: 80,
                                    height: 80,
                                  ),

                                  SizedBox(height: 10),
                                  Text(
                                    '25\u00B0C', // Replace with actual temperature
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
                                    '5PM', // Replace with current time
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Image.asset(
                                    'assets/images/partly_cloudy 1.png', // Replace with your weather icon URL
                                    width: 80,
                                    height: 80,
                                  ),

                                  SizedBox(height: 10),
                                  Text(
                                    '25\u00B0C', // Replace with actual temperature
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
                                    '12:30 PM', // Replace with current time
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Image.asset(
                                    'assets/images/partly_cloudy 1.png', // Replace with your weather icon URL
                                    width: 80,
                                    height: 80,
                                  ),

                                  SizedBox(height: 10),
                                  Text(
                                    '25\u00B0C', // Replace with actual temperature
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
                                    '12:30 PM', // Replace with current time
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Image.asset(
                                    'assets/images/partly_cloudy 1.png', // Replace with your weather icon URL
                                    width: 80,
                                    height: 80,
                                  ),

                                  SizedBox(height: 10),
                                  Text(
                                    '25\u00B0C', // Replace with actual temperature
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
                      ],
                    ),
                  ),
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
                              '5:51PM', // Replace with current time
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
                              '7:00AM', // Replace with current time
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
                  Expanded(
                    child: Container(
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
                                '1 Low',
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
