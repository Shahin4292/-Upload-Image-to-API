import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upload_image_api/service/service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String isImageUpload = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Upload Image to API"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    Uint8List bytes = await image.readAsBytes();
                    UploadApiImage()
                        .uploadImage(bytes, image.name)
                        .then((value) {
                      setState(() {
                        isImageUpload = value['location'].toString();
                      });
                      print(
                          "Upload Successfully with link ${value.toString()}");
                    }).onError((error, stackTrace) {
                      print(error.toString());
                    });
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Upload Images",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blue),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
