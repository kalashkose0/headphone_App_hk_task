import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(children: [
          const Text(
            'Hi-Fi Shop & Service',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            'Audio shop on Rustaveli Ave 57.',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          const SizedBox(height: 5),
          Text(
            'This shop offers both products and services',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          const SizedBox(height: 20),
          // Row(
          //   children: [
          //     const Text("Products",
          //         style: TextStyle(
          //             fontSize: 25,
          //             fontWeight: FontWeight.w500,
          //             color: Color.fromARGB(255, 44, 58, 206))),
          // const SizedBox(
          //   width: 3,
          // ),
          // const Text(
          //   "41",
          //   style: TextStyle(fontSize: 25, color: Colors.grey),
          // ),
          //     const SizedBox(
          //       width: 130,
          //     ),
          //     GestureDetector(
          //         child: const Text("Show all",
          //             style: TextStyle(color: Colors.blue))),
          //   ],
          // ),

          _buildSectionHeader(context, 'Products', '41'),

          const SizedBox(
            height: 20,
          ),

          _buildProductRow([
            Product(
              image: 'assets/images/hk1.png',
              name: 'AKG N700NCM2 Wireless Headphones',
              price: '\$199.00',
            ),
            Product(
              image: 'assets/images/hk2.png',
              name: 'AIAIAI TMA-2 Modular Headphones',
              price: '\$250.00',
            ),
          ]),

          const SizedBox(
            height: 20,
          ),

          _buildSectionHeader(context, 'Accessories', '19'),
          const SizedBox(
            height: 20,
          ),
          _buildProductRow([
            Product(
              image: 'assets/images/hk3.png',
              name: 'AIAIAI 3.5mm Jack 2m',
              price: '\$25.00',
              availability: 'Available',
            ),
            Product(
              image: 'assets/images/hk4.png',
              name: 'AIAIAI 3.5mm Jack 1.5m',
              price: '\$15.00',
              availability: 'Unavailable',
            ),
          ]),

          // Row(
          //   children: [
          //     const Text("Accessories",
          //         style: TextStyle(
          //             fontSize: 25,
          //             fontWeight: FontWeight.w500,
          //             color: Color.fromARGB(255, 44, 58, 206))),
          //     const SizedBox(
          //       width: 3,
          //     ),
          //     const Text(
          //       "19",
          //       style: TextStyle(fontSize: 25, color: Colors.grey),
          //     ),
          //     const SizedBox(
          //       width: 95,
          //     ),
          //     GestureDetector(
          //         child: const Text("Show all",
          //             style: TextStyle(color: Colors.blue))),
          //   ],
          // ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, String count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$title',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 44, 58, 206)),
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          "$count",
          style: TextStyle(fontSize: 25, color: Colors.grey),
        ),
        const SizedBox(
          width: 100,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Show all',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  Widget _buildProductRow(List<Product> products) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: products.map((product) => _buildProductCard(product)).toList(),
    );
  }

  Widget _buildProductCard(Product product) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  product.image,
                  height: 80,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              product.name,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            Text(
              product.price,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
            if (product.availability != null) ...[
              SizedBox(height: 4),
              Text(
                product.availability!,
                style: TextStyle(
                  color: product.availability == 'Available'
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class Product {
  final String image;
  final String name;
  final String price;
  final String? availability;

  Product({
    required this.image,
    required this.name,
    required this.price,
    this.availability,
  });
}
