import 'package:flutter/material.dart';
import 'package:online_shopping/model/product_model.dart';
import 'package:online_shopping/pages/cart_page.dart';
import 'package:online_shopping/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(product.title),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(screenWidth),
            _buildProductInfo(screenWidth),
            _buildProductDescription(),
            _buildAddToCartButton(context, screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(double screenWidth) {
    return Stack(
      children: [
        Container(
          height: screenWidth * 0.75,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 6),
                blurRadius: 12,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
            child: Image.network(
              product.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(screenWidth * 0.04),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: Text(
              product.title,
              style: TextStyle(
                fontSize: screenWidth * 0.08,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductInfo(double screenWidth) {
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$${product.price}',
                style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenWidth * 0.02),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: screenWidth * 0.05),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    '4.5 Rating',
                    style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.grey[700]),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.share, color: Colors.teal, size: screenWidth * 0.07),
            onPressed: () {
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProductDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.description,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildAddToCartButton(BuildContext context, double screenWidth, double screenHeight) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.03),
    child: ElevatedButton(
      onPressed: () {
        Provider.of<CartProvider>(context, listen: false).addItem(product.toMap());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${product.title} added to cart')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
        textStyle: TextStyle(fontSize: screenWidth * 0.05),
      ),
      child: const Text('Add to Cart'),
    ),
  );
}

}
