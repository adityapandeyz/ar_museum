import 'dart:typed_data';

import 'package:ar_museum/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/custom_button.dart';

class ModelUploadScreen extends StatefulWidget {
  const ModelUploadScreen({super.key});

  @override
  State<ModelUploadScreen> createState() => _ModelUploadScreenState();
}

class _ModelUploadScreenState extends State<ModelUploadScreen> {
  Uint8List? imageFileUint8List;
  bool isUploading = false;

  TextEditingController modelNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                isUploading == true
                    ? const LinearProgressIndicator(
                        color: Colors.white,
                      )
                    : const SizedBox(),
                SizedBox(
                  height: 230,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Center(
                    child: imageFileUint8List != null
                        ? Image.memory(
                            imageFileUint8List!,
                          )
                        : const Icon(
                            FontAwesomeIcons.image,
                            size: 48,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  label: 'Model Name',
                  controller: modelNameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  label: 'Description',
                  maxLines: 4,
                  controller: descriptionController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  text: 'Upload',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
