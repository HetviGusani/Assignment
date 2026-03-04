import 'package:flutter/material.dart';

class AvatarBadge extends StatelessWidget {
  final String imagePath; // can be asset path or network URL
  final double size;
  final bool isOnline;
  final bool isAsset; // true if using asset image

  const AvatarBadge({
    Key? key,
    required this.imagePath,
    this.size = 60.0,
    this.isOnline = false,
    this.isAsset = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: size / 2,
          backgroundImage: isAsset
              ? AssetImage(imagePath) as ImageProvider
              : NetworkImage(imagePath),
        ),
        if (isOnline)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: size / 5,
              height: size / 5,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}