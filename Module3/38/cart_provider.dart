import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  double get totalPrice {
    return _cartItems.fold(
      0.0,
          (sum, item) => sum + (item['price'] as double),
    );
  }

  void addItem(Map<String, dynamic> item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeItem(Map<String, dynamic> item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}