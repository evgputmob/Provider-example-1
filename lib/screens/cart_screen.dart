import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/models/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();
    final cartItemsCount = cart.items.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Cart:  ${cart.items.length} item(s)'),
        actions: [
          Visibility(
            visible: (cartItemsCount > 0),
            child: IconButton(
              onPressed: () => cart.removeAll(),
              icon: const Icon(Icons.delete),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        trailing: IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () {
            cart.remove(cart.items[index]);
          },
        ),
        title: Text(
          cart.items[index].name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(cart.items[index].price.toStringAsFixed(2)),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return Container(
      color: Colors.cyan[200],
      height: 120,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Total sum:',
              style: TextStyle(fontSize: 26),
            ),
            const SizedBox(height: 6),
            Text(
              cart.totalPrice.toStringAsFixed(2),
              style: const TextStyle(fontSize: 36),
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
