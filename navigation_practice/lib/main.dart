import 'package:flutter/material.dart';

void main() {
  runApp(ProductApp());
}

class ProductApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Navigation',
      home: ProductListScreen(),
    );
  }
}

class Product {
  final String name;
  final String description;
  final int price;

  Product({required this.name, required this.description, required this.price});
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
        name: "Pixel 1",
        description: "Pixel is the most featureful phone ever",
        price: 800),
    Product(
        name: "Laptop",
        description: "Laptop is most productive development tool",
        price: 2000),
    Product(
        name: "Tablet",
        description: "Tablet is the most useful device ever for a meeting",
        price: 1500),
    Product(
        name: "Pendrive",
        description: "Pendrive is the stylish phone ever",
        price: 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Navigation")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text("Price: \$${products[index].price}"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsScreen(product: products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              product.description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "Price: \$${product.price}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
