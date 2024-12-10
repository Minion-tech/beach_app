import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:beach_app/widgets/category_section.dart';
import 'dart:convert';


class BeachDetailsPage extends StatefulWidget {
  const BeachDetailsPage({super.key});

  @override
  _BeachDetailsPageState createState() => _BeachDetailsPageState();
}

class _BeachDetailsPageState extends State<BeachDetailsPage> {
  final List<String> images = [
    "assets/places/Radhanagar.jpg",
    "assets/places/radhanagar_1.jpg",
    "assets/places/Radhanagar-Beach-2.jpg",
    "assets/places/Radhanagar_3.jpg",
  ];

  int _currentIndex = 0; // Tracks the selected image
  final LatLng _mapCenter = LatLng(11.984334, 92.952485);

  String markerColor = "green"; // Default marker color
  Map<String, dynamic>? weatherData;

  @override
  void initState() {
    super.initState();
    fetchWeatherData(); // Fetch weather data when the widget is initialized
  }

  // Fetch weather data from backend
  Future<void> fetchWeatherData() async {
    final apiUrl =
        "http://192.168.43.173:8000/auth/api/weather/?lat=${_mapCenter.latitude}&lon=${_mapCenter.longitude}";
         print("API URL: $apiUrl");


  try {
      final response = await http.get(Uri.parse(apiUrl));
      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("Parsed Data: $data");

        setState(() {
          weatherData = data;

          // Example logic for marker color
          if (data['wind_speed'] > 10) {
            markerColor = "red";
            print("Marker Color: RED");
          } else if (data['wind_speed'] > 5) {
            markerColor = "yellow";
            print("Marker Color: YELLOW");
          } else {
            markerColor = "green";
            print("Marker Color: GREEN");
          }
        });
      } else {
        print("API Error: Status Code ${response.statusCode}");
        setState(() {
          weatherData = {"error": "Failed to fetch weather data"};
        });
      }
    } catch (e) {
      print("Exception: $e");
      setState(() {
        weatherData = {"error": "Failed to fetch weather data"};
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main Image with Carousel and Blur Effect
              Stack(
                children: [
                  // Blurred Background for the Carousel
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Image.asset(
                          images[_currentIndex],
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: Colors.black
                                  .withOpacity(0.4), // Optional tint
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Main Image Carousel
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 120, // Slider height
                        viewportFraction: 0.3, // Adjust to show multiple images
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: images.map((image) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = images.indexOf(image);
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: Colors.white,
                                  width: 2), // Highlight current
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  // Back Button
                  Positioned(
                    left: 10,
                    top: 10,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  // Favorite Button
                  Positioned(
                    right: 10,
                    top: 10,
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border,
                          color: Colors.white),
                      onPressed: () {
                        // Add favorite functionality
                      },
                    ),
                  ),
                ],
              ),

              // Title and Explore Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Radhanagar Beach",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          "Andaman and Nicobar island",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add navigation or functionality for "Explore now"
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Explore now"),
                    ),
                  ],
                ),
              ),

              // Activities Section
              const SizedBox(height: 30), // Spacing before Activities Section
              const CategoriesSection(),

              // Map Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    height: 300, // Explicit height for the map
                    child: FlutterMap(
                      options: MapOptions(
                        center: _mapCenter,
                        zoom: 15.0,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c'],
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: _mapCenter,
                              builder: (ctx) => Icon(
                                Icons.location_on,
                                color: markerColor == "red"
                                    ? Colors.red
                                    : markerColor == "yellow"
                                        ? Colors.yellow
                                        : Colors.green,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Weather Parameters Below Map
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: weatherData != null
                    ? weatherData!.containsKey("error")
                        ? Center(child: Text(weatherData!["error"]))
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Temperature: ${weatherData!['temperature']}°K",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Humidity: ${weatherData!['humidity']}%",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Wind Speed: ${weatherData!['wind_speed']} m/s",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Condition: ${weatherData!['weather_condition']}",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          )
                    : Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

