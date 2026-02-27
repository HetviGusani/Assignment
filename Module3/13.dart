import 'package:flutter/material.dart';

class changeImgSrc extends StatefulWidget {
  const changeImgSrc({super.key});

  @override
  State<changeImgSrc> createState() => _changeImgSrcState();
}

class _changeImgSrcState extends State<changeImgSrc> {
  List imageURLs = [
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
    "https://gratisography.com/wp-content/uploads/2024/03/gratisography-funflower-800x525.jpg",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Change Image Source")),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Container(
              height: 300,
              width: 300,
              child: Image.network(imageURLs[currentIndex]),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentIndex++;
                  if (currentIndex >= imageURLs.length) {
                    currentIndex = 0;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple,
              ),
              child: Text("Change"),
            ),
          ],
        ),
      ),
    );
  }
}
