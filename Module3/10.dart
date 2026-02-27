import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

var total = 0;

class _ShoppingCartState extends State<ShoppingCart> {
  List items = [
    "Wheat flour (Atta)",
    "Basmati rice",
    "Toor Dal (pigeon peas)",
    "Cooking oil (e.g., sunflower or mustard oil)",
    "Tea leaves / Tea bags",
    "Milk (packaged)",
    "Butter or Ghee",
    "Packet noodles",
    "Biscuits & cookies",
    "Chips & snacks",
    "Fresh seasonal fruits",
    "Fresh vegetables",
    "Toothpaste",
    "Shampoo",
    "Soap bars / Body wash",
    "Dishwashing liquid",
    "Laundry detergent powder",
    "Kitchen utensils (like saucepan)",
    "Plastic storage containers",
    "Diapers",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Items in Cart : $total"),backgroundColor: Color(0xFF6C63FF),foregroundColor: Colors.white,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(items[index],style: TextStyle(fontWeight: FontWeight.bold),),
                    tileColor: Color(0xFFF3F2FF),
                    textColor: Colors.black87,
                    trailing: IconButton(
                      onPressed: () {///
                        setState(() {
                          total++;
                        });
                      }, icon: Icon(Icons.add_shopping_cart),),
                    ),
                  );
              },
          ),
        ),
      ),
    );
  }
}
