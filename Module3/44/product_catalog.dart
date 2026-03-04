import 'package:flutter/material.dart';

class ProductCatalog extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Running Shoes',
      'price': 1500,
      'image':
      'https://images.unsplash.com/photo-1606813908232-1c20b95cf17d?auto=format&fit=crop&w=400&q=80'
    },
    {
      'name': 'Backpack',
      'price': 800,
      'image':
      'https://images.unsplash.com/photo-1598300059425-4b7f1762a45b?auto=format&fit=crop&w=400&q=80'
    },
    {
      'name': 'Wrist Watch',
      'price': 2000,
      'image':
      'https://images.unsplash.com/photo-1612874741600-01a5a5d1a7d1?auto=format&fit=crop&w=400&q=80'
    },
  ];

  ProductCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            elevation: 3,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Image.network(product['image'], width: 60, fit: BoxFit.cover),
              title: Text(product['name'], style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('₹${product['price']}'),
              trailing: Icon(Icons.shopping_cart),
            ),
          );
        },
      ),
    );
  }
}