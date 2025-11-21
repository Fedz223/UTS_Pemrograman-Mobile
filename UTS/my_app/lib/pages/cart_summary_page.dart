import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_cubit.dart';
import '../models/product_model.dart';

class CartSummaryPage extends StatelessWidget {
  const CartSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart Summary")),
      body: BlocBuilder<CartCubit, Map<ProductModel, int>>(
        builder: (context, cart) {
          if (cart.isEmpty) {
            return Center(child: Text("Keranjang kosong"));
          }

          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: cart.entries.map((entry) {
                    final product = entry.key;
                    final qty = entry.value;

                    return ListTile(
                      leading: Image.network(product.image),
                      title: Text(product.name),
                      subtitle: Text("Rp ${product.price}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // BONUS: tombol -
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              context
                                  .read<CartCubit>()
                                  .updateQuantity(product, qty - 1);
                            },
                          ),

                          Text("$qty"),

                          // BONUS: tombol +
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              context
                                  .read<CartCubit>()
                                  .updateQuantity(product, qty + 1);
                            },
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              // TOTAL
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "Total Item : ${context.read<CartCubit>().getTotalItems()}",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Total Harga : Rp ${context.read<CartCubit>().getTotalPrice()}",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),

                    // CHECKOUT
                    ElevatedButton(
                      onPressed: () {
                        context.read<CartCubit>().clearCart();
                      },
                      child: Text("Checkout"),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}