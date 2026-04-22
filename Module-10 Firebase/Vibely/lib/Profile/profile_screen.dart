import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vibely/others/appbar.dart';
import '../models/user_provider.dart';
import '../others/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;

  File? _imageFile;
  String? _imageUrl;

  // 📸 pick image
  Future<void> pickImage() async {
    final picked =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
      });

      uploadImage();
    }
  }

  // ☁ upload to Firebase
  Future<void> uploadImage() async {
    if (_imageFile == null) return;

    final ref = FirebaseStorage.instance
        .ref()
        .child("profile_images")
        .child("${user!.uid}.jpg");

    await ref.putFile(_imageFile!);
    String url = await ref.getDownloadURL();

    // ✅ Save URL to Firestore
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .set({"photoUrl": url}, SetOptions(merge: true));

    setState(() {
      _imageUrl = url;
    });

    // In uploadImage(), after saving to Firestore:
    context.read<UserProvider>().updatePhoto(url);
  }

  @override
  Widget build(BuildContext context) {
    String username = user?.email?.split("@")[0] ?? "User";

    return Scaffold(
      appBar: CommonAppBar(title: "Profile"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // 🔥 Profile Image (Clickable)
            InkWell(
              onTap: pickImage,
              borderRadius: BorderRadius.circular(60),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColors.primary.withOpacity(0.2),
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!)
                        : (_imageUrl != null
                        ? NetworkImage(_imageUrl!)
                        : null) as ImageProvider?,
                    child: _imageFile == null && _imageUrl == null
                        ? Text(
                      username[0].toUpperCase(),
                      style: TextStyle(
                        fontSize: 40,
                        color: AppColors.primary,
                      ),
                    )
                        : null,
                  ),

                  // 📷 Camera Icon
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 👤 Username
            Text(
              username,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            // 📧 Email
            Text(
              user?.email ?? "",
              style: TextStyle(color: Colors.grey.shade600),
            ),

            const SizedBox(height: 25),

            // 📋 Info Cards
            _buildInfoTile(Icons.phone, "Phone", "Not added"),
            _buildInfoTile(Icons.location_on, "Location", "Not set"),
            _buildInfoTile(Icons.info, "Bio", "Add something about you"),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // 🔹 reusable tile
  Widget _buildInfoTile(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(value, style: TextStyle(color: Colors.grey.shade600)),
              ],
            )
          ],
        ),
      ),
    );
  }
}