import 'package:flutter/material.dart';
import 'package:product_card/product_card.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: firstColor,
        ),
        body: ChangeNotifierProvider<ProductState>(
          create: (context) => ProductState(),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Consumer<ProductState>(
                builder: (context, product, _) => ProductCard(
                  imageURL:
                      "https://sc04.alicdn.com/kf/U9e49811f54d7455abf6ca756e7fb3bcch.jpg",
                  name: "Anggur mix 1kg",
                  price: "Rp.50.000",
                  quantity: product.quantity,
                  notification: (product.quantity > 5) ? "diskon 10%" : null,
                  onAddCartTap: () {},
                  onIncTap: () {
                    product.quantity++;
                  },
                  onDecTap: () {
                    product.quantity--;
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductState with ChangeNotifier {
  int _quantity = 0;

  int get quantity => _quantity;
  set quantity(int newValue) {
    _quantity = newValue;
    notifyListeners();
  }
}
