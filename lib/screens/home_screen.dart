import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import 'package:ar_museum/maps/glb_test.dart';
import 'package:ar_museum/maps/local_and_web_object_view.dart';
import 'package:ar_museum/screens/about_screen.dart';
import 'package:ar_museum/screens/model_upload_screen.dart';
import 'package:ar_museum/screens/solar_system_screen.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import 'qr_scanner_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 8.0, top: 8, bottom: 8, right: 0),
          child: CircleAvatar(
            radius: 13,
            child: CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage(
                'assets/8k_moon.jpg',
              ),
            ),
          ),
        ),
        title: const Text(
          'AR Museum',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const QrScannerScreen(),
                ),
              );
            },
            icon: const Icon(
              FontAwesomeIcons.qrcode,
              size: 16,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const AboutAppScreen(),
                ),
              );
            },
            icon: const Icon(
              FontAwesomeIcons.info,
              size: 16,
            ),
          ),
          IconButton(
            onPressed: () {
              Provider.of<AdminAuthProvider>(context, listen: false)
                  .logoutAdmin(context);
            },
            icon: const Icon(
              FontAwesomeIcons.signOut,
              size: 16,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 300,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/types_20of_20ar.png'),
              ),
            ),
            GridView.count(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const QrScannerScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[300],
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          FontAwesomeIcons.qrcode,
                          size: 50,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Scan QR'),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const SolarSystemScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[200],
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          FontAwesomeIcons.earth,
                          size: 50,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Planets'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const LocalAndWebObjectsView(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 150,
                padding: const EdgeInsets.all(8),
                color: Colors.teal[400],
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      FontAwesomeIcons.cube,
                      size: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Graphics Library Transmission Format (GLTF)'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[400],
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("""
  As our phone moves through the world, ARCore uses a process called simultaneous localization and mapping, or SLAM, to understand where the phone is relative to the world around it. ARCore detects visually distinct features in the captured camera image called feature points and uses these points to compute its change in location. The visual information is combined with inertial measurements from the device's IMU to estimate the pose (position and orientation) of the camera relative to the world over time.
              """)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[400],
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("""
  An inertial measurement unit (IMU) is an electronic device that measures and reports a body's specific force, angular rate, and sometimes the orientation of the body, using a combination of accelerometers, gyroscopes, and sometimes magnetometers. When the magnetometer is included, IMUs are referred to as IMMUs.
              """)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
