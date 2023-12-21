import 'package:ar_museum/screens/error_screen.dart';
import 'package:ar_museum/screens/qr_scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parallax_animation/parallax_area.dart';
import 'package:parallax_animation/parallax_widget.dart';

import '../maps/ar_earth_map_screen.dart';
import '../maps/ar_jupiter_map_screen.dart';
import '../maps/ar_mars_map_screen.dart';
import '../maps/ar_mercury_map_screen.dart';
import '../maps/ar_moon_map_screen.dart';
import '../maps/ar_neptune_map_screen.dart';
import '../maps/ar_saturn_map_screen.dart';
import '../maps/ar_sun_map_screen.dart';
import '../maps/ar_uranus_map_screen.dart';
import '../maps/ar_venus_map_screen.dart';
import '../models/planets.dart';

class SolarSystemScreen extends StatefulWidget {
  const SolarSystemScreen({
    super.key,
  });

  @override
  State<SolarSystemScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SolarSystemScreen> {
  final List<Planet> _items = [
    Planet(
      'assets/2k_sun.jpg',
      'Sun',
    ),
    Planet(
      'assets/2k_mercury.jpg',
      'Mercury',
    ),
    Planet(
      'assets/2k_venus_surface.jpg',
      'Venus',
    ),
    Planet(
      'assets/earth_map.jpg',
      'Earth',
    ),
    Planet(
      'assets/2k_moon.jpg',
      'Moon',
    ),
    Planet(
      'assets/2k_mars.jpg',
      'Mars',
    ),
    Planet(
      'assets/2k_jupiter.jpg',
      'Jupiter',
    ),
    Planet(
      'assets/2k_saturn.jpg',
      'Saturn',
    ),
    Planet(
      'assets/2k_uranus.jpg',
      'Uranus',
    ),
    Planet(
      'assets/2k_neptune.jpg',
      'Neptune',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Planets',
        ),
      ),
      body: ParallaxArea(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _items.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (() {
                redirect(
                  context,
                  _items[index].name,
                );
              }),
              child: ParallaxWidget(
                overflowWidthFactor: 2,
                overflowHeightFactor: 1.9,
                background: Image(
                  image: AssetImage(_items[index].image),
                ),

                //  CachedNetworkImage(
                //   imageUrl: _items[index].image,
                //   placeholder: (context, url) => Container(
                //       // color: secondaryColor,
                //       ),
                //   fit: BoxFit.cover,
                // ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _items[index].name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  redirect(BuildContext context, location) {
    if (location == 'Sun') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const ArSunMapScreen(),
        ),
      );
    } else if (location == 'Mercury') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const ArMercuryMapScreen(),
        ),
      );
    } else if (location == 'Venus') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const ArVenusMapScreen(),
        ),
      );
    } else if (location == 'Earth') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const ArEarthMapScreen(),
        ),
      );
    } else if (location == 'Moon') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const ArMoonMapScreen(),
        ),
      );
    } else if (location == 'Mars') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const ArMarsMapScreen(),
        ),
      );
    } else if (location == 'Jupiter') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const ArJupiterMapScreen(),
        ),
      );
    } else if (location == 'Saturn') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const ArSaturnMapScreen(),
        ),
      );
    } else if (location == 'Uranus') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const ArUranusMapScreen(),
        ),
      );
    } else if (location == 'Neptune') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const ArNeptuneMapScreen(),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ErrorScreen(
            locatin: location.toString(),
          ),
        ),
      );
    }
  }
}
