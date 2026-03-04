import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'total.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final List<Map<String, dynamic>> products = [
    {'name': 'Shoes', 'price': 1500.0},
    {'name': 'Bag', 'price': 800.0},
    {'name': 'Watch', 'price': 2000.0},
    {'name': 'T-Shirt', 'price': 500.0},
  ];

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("Shopping Cart")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];

                return Card(
                  child: ListTile(
                    title: Text(item['name']),
                    subtitle: Text("₹ ${item['price']}"),
                    trailing: ElevatedButton(
                      onPressed: () {
                        cart.addItem(item);
                      },
                      child: Text("Add"),
                    ),
                  ),
                );
              },
            ),
          ),

          CartTotalWidget(),

          SizedBox(height: 10),
        ],
      ),
    );
  }
}
