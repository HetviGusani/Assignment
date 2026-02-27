import 'dart:async';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  List<String> imageURLs = [
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

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < imageURLs.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );

      setState(() {}); // 🔥 important
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Carousel")),
      body: Column(
        children: [
          SizedBox(height: 200,),
          SizedBox(
            height: 220,
            child: PageView.builder(
              controller: _pageController,
              itemCount: imageURLs.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imageURLs[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                );
              },
            ),
          ),

          /// 🔵 Indicator Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              imageURLs.length,
              (index) => Container(
                margin: const EdgeInsets.all(4),
                width: _currentPage == index ? 12 : 8,
                height: _currentPage == index ? 12 : 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
