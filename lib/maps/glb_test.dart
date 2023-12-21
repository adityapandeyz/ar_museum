import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_flutter_plugin/widgets/ar_view.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vector_math/vector_math_64.dart' as vectore64;

class GlbTest extends StatefulWidget {
  const GlbTest({super.key});

  @override
  State<GlbTest> createState() => _GlbTestState();
}

class _GlbTestState extends State<GlbTest> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;
  ARNode? localObjectNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GlbTest'),
      ),
      body: ARView(
        onARViewCreated: onARViewCreated,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onLocalObjectButtonPressed();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void onARViewCreated(
    ARSessionManager arSessionManager,
    ARObjectManager arObjectManager,
    ARAnchorManager arAnchorManager,
    ARLocationManager arLocationManager,
  ) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;

    this.arSessionManager.onInitialize(
          showFeaturePoints: false,
          showPlanes: true,
          showWorldOrigin: true,
          handleTaps: false,
        );

    this.arObjectManager.onInitialize();
  }

  Future<void> onLocalObjectButtonPressed() async {
    if (localObjectNode != null) {
      arObjectManager.removeNode(localObjectNode!);
      localObjectNode = null;
    } else {
      var newNode = ARNode(
        type: NodeType.webGLB,
        uri:
            "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF-Binary/Duck.glb", // Replace with your actual asset path
        scale: vectore64.Vector3(0.2, 0.2, 0.2),
        // position: vectore64.Vector3(0.0, 0.0, 0.0),
        // rotation: vectore64.Vector4(1.0, 0.0, 0.0, 0.0),
      );

      bool? didAddLocalNode = await arObjectManager.addNode(newNode);
      localObjectNode = (didAddLocalNode!) ? newNode : null;
    }
  }
}
