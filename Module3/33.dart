import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class FadeInEx extends StatefulWidget {
  const FadeInEx({super.key});

  @override
  State<FadeInEx> createState() => _FadeInExState();
}

class _FadeInExState extends State<FadeInEx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fade In")),
      body: Center(
        child: FadeInImage(
          placeholder: MemoryImage(kTransparentImage),
          image: NetworkImage(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUsbmTZu_uMrmJ0z--CrG-o1UIXytu1OCizQ&s",
          ),
          fadeInDuration: Duration(seconds: 5),
        ),
      ),
    );
  }
}
