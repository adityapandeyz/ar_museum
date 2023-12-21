import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'error_screen.dart';
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

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  MobileScannerController cameraController = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    // detectionSpeed: DetectionSpeed.noDuplicates,
    facing: CameraFacing.back,
    torchEnabled: true,
  );
  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR'),
        actions: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state as TorchState) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
        ],
      ),
      body: MobileScanner(
        controller: cameraController,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          cameraController.stop();
          for (final barcode in barcodes) {
            debugPrint('Barcode found! ${barcode.rawValue}');
            redirect(context, barcode.rawValue);
          }
        },
      ),
    );
  }

  redirect(BuildContext context, location) {
    debugPrint("Scanned location: $location");

    if (location.toString().toLowerCase() == 'http://sun') {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const ArSunMapScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    } else if (location == 'http://mercury') {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const ArMercuryMapScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    } else if (location == 'http://venus') {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const ArVenusMapScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    } else if (location == 'http://earth') {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const ArEarthMapScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    } else if (location == 'http://moon') {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const ArMoonMapScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    } else if (location == 'http://mars') {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const ArMarsMapScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    } else if (location == 'http://jupiter') {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const ArJupiterMapScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    } else if (location == 'http://saturn') {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const ArSaturnMapScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    } else if (location == 'http://uranus') {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const ArUranusMapScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    } else if (location == 'http://neptune') {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const ArNeptuneMapScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    } else {
      print(location.toString());

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
