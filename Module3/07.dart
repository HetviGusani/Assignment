import 'package:flutter/material.dart';

class GridOfImages extends StatelessWidget {
  GridOfImages({super.key});

  List imageURLs=[
    "https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg",
    "https://gratisography.com/wp-content/uploads/2025/01/gratisography-dog-vacation-800x525.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUsbmTZu_uMrmJ0z--CrG-o1UIXytu1OCizQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3kCrw3N9kzVNr-DwA0j-TGy80yQZrdOTAbQ&s",
    "https://images.all-free-download.com/images/thumbjpg/wild_animal_picture_relaxing_tiger_6934816.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBGzFgNUeo-o2KL2SDyePh3JpJElVdom8EnA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyOFY0v1-_WAG1qNcaSxf3SdwAHP-U15ltnw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ84JAzbqpvrhgDH9cJRIrV6DJ928ZBwz73Jw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx-SfzikhR2Xc7K_zwJEPObbGJ9TxD68OcwA&s",
    "https://img.freepik.com/free-photo/closeup-shot-beautiful-butterfly-with-interesting-textures-orange-petaled-flower_181624-7640.jpg?semt=ais_hybrid&w=740&q=80",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsFIpjVU6uDerJamikcRTX9BCh_4u0rWMdSA&s",
    "https://gratisography.com/wp-content/uploads/2024/03/gratisography-funflower-800x525.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid of Images")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8.0
            ),
            itemCount: imageURLs.length,
            itemBuilder: (BuildContext context, int index) {
              return Image.network(imageURLs[index]);
            },

          ),
        ),
      ),
    );
  }
}
