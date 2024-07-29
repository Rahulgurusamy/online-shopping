import 'package:flutter/material.dart';
import 'package:online_shopping/pages/product_card.dart';
import 'package:online_shopping/pages/product_detail_page.dart';
import 'package:online_shopping/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final double padding = screenSize.width * 0.05;
    final double searchFieldHeight = isPortrait ? 50 : 40;
    final int crossAxisCount = screenSize.width > 600 ? 3 : 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.teal,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.tealAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(searchFieldHeight),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      _searchController.clear();
                      productProvider.searchProducts('');
                    },
                  ),
                ),
                onChanged: (value) {
                  productProvider.searchProducts(value);
                },
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: productProvider.products.isEmpty
            ? ListView.builder(
                itemCount: 6,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: EdgeInsets.all(padding),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 150,
                        color: Colors.white,
                        child: const Center(
                          child: Text(
                            'Loading...',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Padding(
                padding: EdgeInsets.all(padding),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: padding / 2,
                    mainAxisSpacing: padding / 2,
                  ),
                  itemCount: productProvider.filteredProducts.length,
                  itemBuilder: (ctx, index) {
                    final product = productProvider.filteredProducts[index];
                    return ProductCard(
                      product: product,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => ProductDetailPage(product: product),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
      ),
    );
  }
}
