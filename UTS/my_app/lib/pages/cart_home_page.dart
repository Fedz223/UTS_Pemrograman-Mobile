import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';

class CartHomePage extends StatelessWidget {
  CartHomePage({super.key});

  final products = [
    ProductModel(
      id: "1",
      name: "Produk A",
      price: 10000,
      image: "assets/images/image1.jpg",
    ),
    ProductModel(
      id: "2",
      name: "Produk B",
      price: 15000,
      image: "assets/images/image2.jpg",
    ),
    ProductModel(
      id: "3",
      name: "Produk C",
      price: 20000,
      image: "assets/images/image3.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        title: const Text(
          "Products",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6DD5FA), Color(0xFF2980B9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.only(top: 90, left: 12, right: 12),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.78,
            ),
            itemBuilder: (context, index) {
              return Hero(
                tag: products[index].id,
                child: ProductCard(product: products[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
