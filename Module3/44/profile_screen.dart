import 'package:flutter/material.dart';

import 'avtar.dart';
import 'product_catalog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AvatarBadge(
              imagePath: 'assets/img.png',
              size: 100,
              isOnline: true,
            ),
            SizedBox(height: 12),
            Text('Hetvi Gusani',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text('Flutter Developer | UI/UX Enthusiast',
                style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('150', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Followers'),
                  ],
                ),
                Column(
                  children: [
                    Text('200', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Following'),
                  ],
                ),
                Column(
                  children: [
                    Text('10', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Posts'),
                  ],
                ),
              ],
            ),
            Expanded(child: ProductCatalog())
          ],
        ),
      ),
    );
  }
}