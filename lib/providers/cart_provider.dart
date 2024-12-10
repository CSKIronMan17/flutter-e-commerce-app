import 'package:flutter/material.dart';
import '../models/product.dart';

// Program to add or remove products from cart

class CartProvider with ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  double get totalAmount {
    return _cartItems.fold(0.0, (sum, item) => sum + item.price);
  }

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}
