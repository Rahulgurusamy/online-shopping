import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  String selectedCategory = 'All';

  final Map<String, List<Map<String, String>>> categoryImages = {
    'Mobile Phones': [
      {'image': 'assets/apple 15.jpg', 'name': 'Apple 15'},
      {'image': 'assets/apple 15pro.jpg', 'name': 'Apple 15 Pro'},
      {'image': 'assets/Redmi-Note-10-Pro.jpg', 'name': 'Redmi Note 10 Pro'},
      {'image': 'assets/oneplus.jpg', 'name': 'OnePlus'},
    ],
    'Men Clothes': [
      {'image': 'assets/men dress 1.jpg', 'name': 'Shirts & Shorts'},
      {'image': 'assets/men dress 2.jpg', 'name': 'Blazer'},
      {'image': 'assets/men dress 3.jpg', 'name': 'Hoodie'},
      {'image': 'assets/men dress 4.jpg', 'name': 'Denim Jack'},
    ],
    'Women Clothes': [
      {'image': 'assets/women dress 1.jpg', 'name': 'Short Neck'},
      {'image': 'assets/women dress 2.jpg', 'name': 'Chudidar'},
      {'image': 'assets/women dress 3.jpg', 'name': 'Frock'},
      {'image': 'assets/women dress 4.jpg', 'name': 'Saree'},
    ],
    'Sports Hub': [
      {'image': 'assets/sports hub 1.jpg', 'name': 'Spartan Bat'},
      {'image': 'assets/sports hub 2.jpg', 'name': 'Football'},
      {'image': 'assets/sports hub 3.jpg', 'name': 'Basketball'},
      {'image': 'assets/sports hub 4.jpg', 'name': 'Shuttle'},
    ],
    'Accessories': [
      {'image': 'assets/acc 1.jpg', 'name': 'Watch'},
      {'image': 'assets/acc 2.jpg', 'name': 'Chain'},
      {'image': 'assets/acc 3.jpg', 'name': 'Mobile Case'},
      {'image': 'assets/acc 4.jpg', 'name': 'Headphone'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final categories = categoryImages.keys.toList();
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    
    double padding = screenSize.width * 0.04;
    double fontSize = isPortrait ? 16.0 : 14.0;
    int crossAxisCount = screenSize.width > 600 ? 3 : 2;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.search, size: fontSize),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            backgroundColor: Colors.teal,
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal, Colors.tealAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              titlePadding: EdgeInsets.all(padding),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: padding / 2),
                child: SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (ctx, index) {
                      final category = categories[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding / 2),
                        child: ChoiceChip(
                          label: Text(
                            category,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: fontSize,
                              color: selectedCategory == category
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          selected: selectedCategory == category,
                          selectedColor: Colors.teal,
                          backgroundColor: Colors.white,
                          onSelected: (selected) {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                final item = categoryImages[selectedCategory]?[index];
                if (item != null) {
                  final imagePath = item['image'];
                  final name = item['name'];
                  return Card(
                    elevation: 8,
                    margin: EdgeInsets.all(padding / 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.asset(
                              imagePath!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(padding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '\$${(index + 1) * 10}',
                                style: TextStyle(
                                  fontSize: fontSize * 0.9,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
              childCount: categoryImages[selectedCategory]?.length ?? 0,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: padding,
              mainAxisSpacing: padding,
              childAspectRatio: 0.7,
            ),
          ),
        ],
      ),
    );
  }
}
