import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

// Program to provide product list from fakestoreapi.com

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [];
  int _currentPage = 0;
  final int _pageSize = 10;

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    final url =
        'https://fakestoreapi.com/products?_start=${_currentPage * _pageSize}&_limit=$_pageSize';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> productData = json.decode(response.body);
        final List<Product> newProducts = productData
            .map((data) => Product.fromJson(data as Map<String, dynamic>))
            .toList();
        _products.addAll(newProducts);
        _currentPage++;
        notifyListeners();
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
