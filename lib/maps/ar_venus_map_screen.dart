import 'package:ar_museum/main.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vector_math/vector_math_64.dart' as vectore64;

import '../screens/home_screen.dart';

class ArVenusMapScreen extends StatefulWidget {
  const ArVenusMapScreen({super.key});

  @override
  State<ArVenusMapScreen> createState() => _ArVenusMapScreenState();
}

class _ArVenusMapScreenState extends State<ArVenusMapScreen> {
  ArCoreController? augmentedRealityCoreController;

  augmentedRealityViewCreated(ArCoreController coreController) {
    augmentedRealityCoreController = coreController;

    displayEarthMapSphere(augmentedRealityCoreController!);
  }

  displayEarthMapSphere(ArCoreController coreController) async {
    final ByteData earthTextureBytes =
        await rootBundle.load("assets/2k_venus_surface.jpg");

    final material = ArCoreMaterial(
      color: Colors.blue,
      textureBytes: earthTextureBytes.buffer.asUint8List(),
    );

    final sphere = ArCoreSphere(
      materials: [material],
    );

    final node = ArCoreNode(
      shape: sphere,
      position: vectore64.Vector3(0, 0, -1.5),
    );

    augmentedRealityCoreController!.addArCoreNode(node);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => const HomeScreen(),
              ),
              (Route<dynamic> route) => false,
            );
          },
          icon: const Icon(
            FontAwesomeIcons.arrowLeft,
          ),
        ),
        title: const Text(
          'AR Museum - Venus',
        ),
      ),
      body: ArCoreView(
        onArCoreViewCreated: augmentedRealityViewCreated,
        enableTapRecognizer: true,
      ),
    );
  }
}
