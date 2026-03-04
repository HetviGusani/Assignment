import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartTotalWidget extends StatelessWidget {
  const CartTotalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        return Column(
          children: [

            Text(
              "Total: ₹ ${cart.totalPrice.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Text(
              "Cart Items:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 120,
              child: cart.cartItems.isEmpty
                  ? const Center(child: Text("No items in cart"))
                  : ListView.builder(
                itemCount: cart.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cart.cartItems[index];

                  return ListTile(
                    title: Text(item['name']),
                    subtitle:
                    Text("₹ ${item['price']}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete,
                          color: Colors.red),
                      onPressed: () {
                        cart.removeItem(item);
                      },
                    ),
                  );
                },
              ),
            ),

          ],
        );
      },
    );
  }
}