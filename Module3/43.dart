import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String image; // image URL or asset path
  final String bio;

  const ProfileCard({
    super.key,
    required this.name,
    required this.image,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Profile Image
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(image),
            ),
            const SizedBox(height: 12),
            // Name
            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Bio
            Text(
              bio,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}