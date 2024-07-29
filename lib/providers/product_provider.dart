import 'package:flutter/material.dart';
import 'package:online_shopping/model/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> _filteredProducts = [];

  ProductProvider() {
    fetchProducts();
  }

  List<Product> get products => _products;
  List<Product> get filteredProducts => _filteredProducts;

  List<Product> get featuredProducts {
    List<Product> sortedProducts = List.from(_products)
      ..sort((a, b) => a.price.compareTo(b.price));
    return sortedProducts.take(5).toList();
  }

  void fetchProducts() { 
    _products = [
      Product(
        id: 1,
        title: 'Apple 15pro',
        description: 'iPhone 15 Pro is the first iPhone to feature an aerospace‑grade titanium design, using the same alloy that spacecraft use for missions to Mars. Titanium has one of the best strength‑to‑weight ratios of any metal, making these our lightest Pro models ever. You will notice the difference the moment you pick one up.',
        image: 'assets/apple 15pro.jpg',
        price: 999,
        category: 'Mobile Phones',
      ),
      Product(
        id: 2,
        title: 'Hoodie',
        description: 'A hoodie (in some cases spelled hoody) or hooded sweatshirt is a type of sweatshirt with a hood that, when worn up, covers most of the head and neck, and sometimes the face',
        image: 'assets/men dress 3.jpg',
        price: 69,
        category: 'Clothing',
      ),
      Product(
        id: 3,
        title: 'Blazer',
        description: 'A blazer is a type of jacket resembling a suit jacket, but cut more casually. A blazer is generally distinguished from a sport coat as a more formal garment and tailored from solid colour fabrics. ',
        image: 'assets/men dress 2.jpg',
        price: 149,
        category: 'Clothing',
      ),
      Product(
        id: 4,
        title: 'Shuttle',
        description: 'A shuttlecock (also called a birdie or shuttle) is a high-drag projectile used in the sport of badminton. It has an open conical shape formed by feathers or plastic (or a synthetic alternative) embedded into a rounded cork (or rubber) base.',
        image: 'assets/sports hub 4.jpg',
        price: 19,
        category: 'Sports',
      ),
      Product(
        id: 5,
        title: 'Apple 15',
        description: 'iPhone 15 supports 5G connectivity and a much sharper and brighter OLED display (versus the iPhone 11s LCD). See below for everything else you gain. For iPhone Mini users, the standard iPhone 15 is your best bet if you still want a relatively compact form factor with all the iOS perks',
        image: 'assets/apple 15.jpg',
        price: 899,
        category: 'Mobile Phones',
      ),
      Product(
        id: 6,
        title: 'Short Neck',
        description: 'Neckline is the top edge of a garment that surrounds the neck, especially from the front view',
        image: 'assets/women dress 1.jpg',
        price: 59,
        category: 'Clothing',
      ),
      Product(
        id: 7,
        title: 'Saree',
        description: 'Saree is traditional attire for women of South Asian (especially Indian) descent and is essentially a long piece of fabric that is draped around the body. It is usually worn together with a short fitted blouse, known as a choli, and a long petticoat',
        image: 'assets/women dress 4.jpg',
        price: 199,
        category: 'Clothing',
      ),
      Product(
        id: 8,
        title: 'Watch',
        description: 'Watches provide the time of day, giving at least the hour and minute, and often the second. Many also provide the current date, and some (called "complete calendar" or "triple date" watches) display the day of the week and the month as well.',
        image: 'assets/acc 1.jpg',
        price: 199,
        category: 'Electronics',
      ),
      Product(
         id: 9,
         category: 'Mobile Phone',
         image: 'assets/oneplus.jpg',
         title: 'OnePlus 10r', 
         price: 699, 
         description: 'OnePlus 10R 5G is powered by an octa-core MediaTek Dimensity 8100 5G processor. It comes with 8GB, 12GB of RAM. The OnePlus 10R 5G runs Android 12 and is powered by a 5000mAh non-removable battery. The OnePlus 10R 5G supports Super VOOC fast charging.'
      ),
      Product(
        id: 10,
        category: 'Electronics',
        image: 'assets/acc 3.jpg', 
        title: 'Mobile Case', 
        price: 19, 
        description: 'Phone case features a beautifully designed Floating Liquid coffee cup on the back. The case is made of Silicone and has a raised lip to protect the screen.'
      ),
      Product(
        id: 11,
        category: 'Clothing',
        image: 'assets/men dress 1.jpg', 
        title: 'Shirts & Shorts', 
        price: 49, 
        description: 'Better quality and you can wear whlie going outside/home'
      ),
      Product(
        id: 12,
        category: 'Electronics',
        image: 'assets/acc 4.jpg', 
        title: 'Headphone', 
        price: 129, 
        description: 'Headphones let a single user listen to an audio source privately, in contrast to a loudspeaker, which emits sound into the open air for anyone nearby to hear'
      ),
      Product(
        id: 13,
        category: 'Sports',
        image: 'assets/sports hub 2.jpg', 
        title: 'Football', 
        price: 29, 
        description: 'Football is the ball used in the sport of association football. It is also known as Soccer. The ball spherical shape, as well as its size, weight, mass, and material composition'
      ),
      Product(
        id: 14,
        category: 'Clothing',
        image: 'assets/women dress 2.jpg', 
        title: 'Chudidar', 
        price: 89, 
        description: 'Churidars, also churidar pyjamas, are tightly fitting trousers worn by both men and women in the Indian subcontinent. Churidars are a variant of the common shalwar pants.'
      ),
      Product(
        id: 15,
        category: 'Clothing',
        image: 'assets/men dress 4.jpg', 
        title: 'Denim Jack', 
        price: 79, 
        description: 'Denim Jacket is a short coat made of denim (= a thick, strong cotton cloth, often blue, used especially for making jeans):'
      ),
      Product(
        id: 16,
        category: 'Clothing',
        image: 'assets/women dress 3.jpg', 
        title: 'Frock', 
        price: 99, 
        description: 'From the 16th century to the early 20th century, frock was applied to a womans dress or gown, in the fashion of the day, often indicating an unfitted, comfortable garment for wear in the house, or (later) a light overdress worn with a slip or underdress.'
      ),
      Product(
        id: 17,
        category: 'Electronics',
        image: 'assets/acc 2.jpg', 
        title: 'Chain', 
        price: 59, 
        description: 'Chain necklaces on the other chain refer to jewellery that consists of interconnected metal links that encircle only the neck'
      ),
      Product(
        id: 18,
        category: 'Sports',
        image: 'assets/sports hub 1.jpg', 
        title: 'Spartan Bat', 
        price: 49, 
        description: 'Spartan cricket bats are used by top cricketers and offer a range of models like the MC 329, CG Authority, and MS Dhoni Beast. The brand is known for its quality willow and advanced designs, including the innovative "Helicopter" bat.'
      ),
      Product(
        id: 19,
        category: 'Mobile Phones',
        image: 'assets/assets/Redmi-Note-10-Pro.jpg', 
        title: 'Redmi Note 10pro', 
        price: 499, 
        description: 'The Xiaomi Redmi Note 10 Pro has a 108MP f/1.9 primary camera sensor. It is an eye-catching spec. However, the part of this phones camera array that stands out the most is something else, the 5MP f/2.4 tele-macro. '
      ),
      Product(
        id: 20,
        category: 'Sports',
        image: 'assets/sports hub 3.jpg', 
        title: 'Basketball', 
        price: 39, 
        description: 'Spherical inflated ball measures 29.5 to 30 inches (74.9 to 76 cm) in circumference and weighs 20 to 22 ounces (567 to 624 grams).'
      ),
    ];

    _filteredProducts = _products;
    notifyListeners();
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      _filteredProducts = _products;
    } else {
      _filteredProducts = _products
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}