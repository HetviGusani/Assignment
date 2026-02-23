import 'dart:io';

// Product Class
class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

// Cart Class
class Cart {
  List<Product> products = [];

  void addProduct(Product product) {
    products.add(product);
    print("${product.name} added to cart.");
  }

  double calculateTotal() {
    double total = 0;
    for (var product in products) {
      total += product.price;
    }
    return total;
  }

  void displayCart() {
    if (products.isEmpty) {
      print("Cart is empty.");
    } else {
      print("\nItems in Cart:");
      for (var product in products) {
        print("${product.name} - ₹${product.price}");
      }
    }
  }
}

// Order Class
class Order {
  Cart cart;

  Order(this.cart);

  void placeOrder() {
    double total = cart.calculateTotal();
    print("\nOrder Placed Successfully!");
    print("Total Amount: ₹$total");
  }
}

void main() {
  Cart cart = Cart();
  int choice;

  do {
    print(
        "\n1. Add Product"
            "\n2. View Cart"
            "\n3. Place Order"
            "\n4. Exit");

    stdout.write("Enter your choice: ");
    choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        stdout.write("Enter Product Name: ");
        String name = stdin.readLineSync()!;

        stdout.write("Enter Product Price: ");
        double price = double.parse(stdin.readLineSync()!);

        Product product = Product(name, price);
        cart.addProduct(product);
        break;

      case 2:
        cart.displayCart();
        break;

      case 3:
        Order order = Order(cart);
        order.placeOrder();
        break;

      case 4:
        print("Thank you for shopping!");
        break;

      default:
        print("Invalid Choice!");
    }
  } while (choice != 4);
}
