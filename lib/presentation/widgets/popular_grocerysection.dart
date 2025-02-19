import 'package:flutter/material.dart';
import 'package:groceryapp/core/utils/AppColors.dart';
import 'package:groceryapp/core/utils/AppFont.dart';

class PopularGrocerySection extends StatelessWidget {
  final List<Map<String, String>> groceries = [
    {"name": "Apple", "image": "lib/assets/images/vegetables.png", "volume": "1 kg", "price": "\$2.99"},
    {"name": "Milk", "image": "lib/assets/images/vegetables.png", "volume": "1 liter", "price": "\$1.50"},
    {"name": "Rice", "image": "lib/assets/images/vegetables.png", "volume": "5 kg", "price": "\$10.99"},
    {"name": "Wheat", "image": "lib/assets/images/vegetables.png", "volume": "5 kg", "price": "\$8.99"},
    {"name": "Carrot", "image": "lib/assets/images/vegetables.png", "volume": "1 kg", "price": "\$1.20"},
    {"name": "Eggs", "image": "lib/assets/images/vegetables.png", "volume": "12 pcs", "price": "\$3.50"},
    {"name": "Tomato", "image": "lib/assets/images/vegetables.png", "volume": "1 kg", "price": "\$1.80"},
    {"name": "Orange", "image": "lib/assets/images/vegetables.png", "volume": "1 kg", "price": "\$3.00"},
    {"name": "Potato", "image": "lib/assets/images/vegetables.png", "volume": "2 kg", "price": "\$2.00"},
    {"name": "Onion", "image": "lib/assets/images/vegetables.png", "volume": "2 kg", "price": "\$1.50"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            'Popular Grocery',
            style: AppFonts.heading.copyWith(
              color: AppColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 150, // Adjust height for horizontal scrolling
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: groceries.length,
            itemBuilder: (context, index) {
              return GroceryItemTile(
                name: groceries[index]["name"]!,
                image: groceries[index]["image"]!,
                volume: groceries[index]["volume"]!,
                price: groceries[index]["price"]!,
              );
            },
          ),
        ),
      ],
    );
  }
}

class GroceryItemTile extends StatelessWidget {
  final String name;
  final String image;
  final String volume;
  final String price;

  const GroceryItemTile({
    Key? key,
    required this.name,
    required this.image,
    required this.volume,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 120,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(image, height: 50, fit: BoxFit.contain),
            Text(
              name,
              style: AppFonts.body.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              volume,
              style: AppFonts.body.copyWith(fontSize: 12, color: AppColors.secondary),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: AppFonts.body.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
