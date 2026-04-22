import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? _photoUrl;
  String? get photoUrl => _photoUrl;

  Future<void> fetchUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get();

    _photoUrl = doc.data()?["photoUrl"];
    notifyListeners();
  }

  void updatePhoto(String url) {
    _photoUrl = url;
    notifyListeners();
  }
}