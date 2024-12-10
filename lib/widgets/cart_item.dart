import 'package:flutter/material.dart';

// Program to display items present in the cart

class CartItem extends StatelessWidget {
  final int productId;
  final String productTitle;
  final double price;
  final int quantity;

  const CartItem(
      {required this.productId,
      required this.productTitle,
      required this.price,
      required this.quantity,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        leading: CircleAvatar(
          child: Text('$quantity'),
        ),
        title: Text('Product $productId'), // Replace with actual product title
        subtitle:
            const Text('Price: \$XX'), // Replace with actual product price
        trailing: IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {},
        ),
      ),
    );
  }
}

class CartItems {
  final String productName;
  final double price;

  CartItems({required this.productName, required this.price});
}
