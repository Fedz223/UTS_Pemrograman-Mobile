import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_cubit.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(product.image, height: 120),
          Text(product.name, style: TextStyle(fontSize: 16)),
          Text("Rp ${product.price}", style: TextStyle(fontSize: 14)),
          ElevatedButton(
            onPressed: () {
              context.read<CartCubit>().addToCart(product);
            },
            child: Text("Add to Cart"),
          ),
        ],
      ),
    );
  }
}