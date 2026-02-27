import 'package:flutter/material.dart';

class ImageAsset extends StatefulWidget {
  const ImageAsset({super.key});

  @override
  State<ImageAsset> createState() => _ImageAssetState();
}

class _ImageAssetState extends State<ImageAsset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Asset"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //const SizedBox(height: 20),

              const Text("BoxFit.cover"),
              const SizedBox(height: 10),
              Container(
                height: 150,
                width: 200,
                color: Colors.grey.shade300,
                child: Image.asset(
                  "assets/img.png",
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 30),

              const Text("BoxFit.contain"),
              const SizedBox(height: 10),
              Container(
                height: 150,
                width: 200,
                color: Colors.grey.shade300,
                child: Image.asset(
                  "assets/img.png",
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 30),

              const Text("BoxFit.fill"),
              const SizedBox(height: 10),
              Container(
                height: 150,
                width: 200,
                color: Colors.grey.shade300,
                child: Image.asset(
                  "assets/img.png",
                  fit: BoxFit.fill,
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}