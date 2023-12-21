import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ErrorScreen extends StatelessWidget {
  final String locatin;
  const ErrorScreen({super.key, required this.locatin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error 404'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              FontAwesomeIcons.earth,
              size: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Error 404: Not Found'),
            const SizedBox(
              height: 20,
            ),
            Text(locatin.toString() ?? ''),
          ],
        ),
      ),
    );
  }
}
