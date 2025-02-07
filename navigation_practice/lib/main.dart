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
  final Color color;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.color,
  });
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
        name: "Pixel 1",
        description: "Pixel is the most featureful phone ever",
        price: 800,
        color: Colors.blue),
    Product(
        name: "Laptop",
        description: "Laptop is the most productive development tool",
        price: 2000,
        color: Colors.green),
    Product(
        name: "Tablet",
        description: "Tablet is the most useful device ever for meetings",
        price: 1500,
        color: Colors.amber),
    Product(
        name: "Pendrive",
        description: "A compact and portable USB storage device",
        price: 100,
        color: Colors.brown),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Navigation")),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Moved padding to the ListView
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailsScreen(product: products[index]),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: products[index].color,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 8), // Space between items
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products[index].name,
                      style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      products[index].description,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Price: \$${products[index].price}",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        // Prevent overflow on smaller screens
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: product.color,
              alignment: Alignment.center,
              child: Text(
                product.name,
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Price: \$${product.price}",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return const Icon(Icons.star_border,
                          size: 30, color: Colors.redAccent);
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
