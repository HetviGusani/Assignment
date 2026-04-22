import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final ImagePicker _picker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> pickAndUploadImage() async {
    final XFile? image =
    await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    File file = File(image.path);
    String id = const Uuid().v4();

    try {
      // Upload to Firebase Storage
      TaskSnapshot snapshot =
      await _storage.ref('gallery/$id.jpg').putFile(file);

      String downloadUrl = await snapshot.ref.getDownloadURL();

      // Save URL to Firestore
      await _firestore.collection('images').add({
        'url': downloadUrl,
        'createdAt': Timestamp.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Image uploaded")),
      );
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Gallery"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickAndUploadImage,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('images')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return const Center(child: Text("No images yet"));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              String imageUrl = docs[index]['url'];

              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        },
      ),
    );
  }
}