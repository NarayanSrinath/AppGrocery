import 'package:flutter/material.dart';
import 'package:groceryapp/core/utils/AppColors.dart';
import 'package:groceryapp/core/utils/AppFont.dart';

class NewArrivalsSection extends StatelessWidget {
  final List<Map<String, String>> newArrivals = [
    {"name": "Strawberry", "image": "lib/assets/images/vegetables.png", "volume": "500 gm", "price": "\$3.99"},
    {"name": "Blueberry", "image": "lib/assets/images/vegetables.png", "volume": "250 gm", "price": "\$5.50"},
    {"name": "Almonds", "image": "lib/assets/images/vegetables.png", "volume": "500 gm", "price": "\$7.99"},
    {"name": "Honey", "image": "lib/assets/images/vegetables.png", "volume": "1 liter", "price": "\$6.50"},
    {"name": "Cheese", "image": "lib/assets/images/vegetables.png", "volume": "200 gm", "price": "\$4.20"},
    {"name": "Olive Oil", "image": "lib/assets/images/vegetables.png", "volume": "1 liter", "price": "\$8.99"},
    {"name": "Mushroom", "image": "lib/assets/images/vegetables.png", "volume": "500 gm", "price": "\$2.80"},
    {"name": "Cornflakes", "image": "lib/assets/images/vegetables.png", "volume": "750 gm", "price": "\$3.50"},
    {"name": "Coconut Water", "image": "lib/assets/images/vegetables.png", "volume": "500 ml", "price": "\$2.20"},
    {"name": "Dark Chocolate", "image": "lib/assets/images/vegetables.png", "volume": "100 gm", "price": "\$3.00"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            'New Arrivals',
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
            itemCount: newArrivals.length,
            itemBuilder: (context, index) {
              return NewArrivalsTile(
                name: newArrivals[index]["name"]!,
                image: newArrivals[index]["image"]!,
                volume: newArrivals[index]["volume"]!,
                price: newArrivals[index]["price"]!,
              );
            },
          ),
        ),
      ],
    );
  }
}


class NewArrivalsTile extends StatelessWidget {
  final String name;
  final String image;
  final String volume;
  final String price;

  const NewArrivalsTile({
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
