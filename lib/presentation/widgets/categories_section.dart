import 'package:flutter/material.dart';
import 'package:groceryapp/core/utils/AppColors.dart';
import 'package:groceryapp/core/utils/AppFont.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  bool _showAllCategories = false;

  final List<Map<String, dynamic>> categories = [
    {
      "name": "Fruits",
      "image": "lib/assets/images/vegetables.png",
      "startColor": Colors.red.shade100,
      "endColor": Colors.red.shade300,
    },
    {
      "name": "Vegetables",
      "image": "lib/assets/images/vegetables.png",
      "startColor": Colors.green.shade100,
      "endColor": Colors.green.shade300,
    },
    {
      "name": "Rice",
      "image": "lib/assets/images/vegetables.png",
      "startColor": Colors.yellow.shade100,
      "endColor": Colors.yellow.shade300,
    },
    {
      "name": "Wheat",
      "image": "lib/assets/images/vegetables.png",
      "startColor": Colors.brown.shade100,
      "endColor": Colors.brown.shade300,
    },
    {
      "name": "Milk",
      "image": "lib/assets/images/vegetables.png",
      "startColor": Colors.blue.shade100,
      "endColor": Colors.blue.shade300,
    },
    {
      "name": "Biscuits",
      "image": "lib/assets/images/vegetables.png",
      "startColor": Colors.orange.shade100,
      "endColor": Colors.orange.shade300,
    },
    {
      "name": "Drinks",
      "image": "lib/assets/images/vegetables.png",
      "startColor": Colors.cyan.shade100,
      "endColor": Colors.cyan.shade300,
    },
    {
      "name": "Snacks",
      "image": "lib/assets/images/vegetables.png",
      "startColor": Colors.purple.shade100,
      "endColor": Colors.purple.shade300,
    },
    {
      "name": "Milk",
      "image": "lib/assets/images/vegetables.png",
      "startColor": Colors.blue.shade100,
      "endColor": Colors.blue.shade300,
    },
    {
      "name": "Biscuits",
      "image": "lib/assets/images/vegetables.png",
      "startColor": Colors.orange.shade100,
      "endColor": Colors.orange.shade300,
    },
    {
      "name": "Drinks",
      "image": "lib/assets/images/vegetables.png",
      "startColor": Colors.cyan.shade100,
      "endColor": Colors.cyan.shade300,
    },
    {
      "name": "Snacks",
      "image": "lib/assets/images/vegetables.png",
      "startColor": Colors.purple.shade100,
      "endColor": Colors.purple.shade300,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Categories Header Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _showAllCategories = !_showAllCategories;
                  });
                },
                child: Text(
                  _showAllCategories ? "Show Less" : "View All",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Categories Grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // 4 tiles per row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: _showAllCategories
                ? categories.length
                : 4, // Show only 4 initially
            itemBuilder: (context, index) {
              return _buildCategoryTile(
                categories[index]["name"]!,
                categories[index]["image"]!,
                categories[index]["startColor"],
                categories[index]["endColor"],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryTile(
      String name, String imagePath, Color startColor, Color endColor) {
    return Container(
      width: 90, // Slightly wider for a balanced look
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // More rounded like reference
        gradient: LinearGradient(
          colors: [startColor, endColor], // Gradient background
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0), // Prevents image cropping
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain, // Ensures proper sizing
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black87, // Darker text for readability
            ),
          ),
          SizedBox(height: 6),
        ],
      ),
    );
  }
}
