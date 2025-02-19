import 'package:flutter/material.dart';
import 'package:groceryapp/core/utils/AppColors.dart';
import 'package:groceryapp/core/utils/AppFont.dart';

class FlashSaleSection extends StatelessWidget {
  final List<Map<String, String>> flashSaleItems = [
    {"name": "Apple", "image": "lib/assets/images/vegetables.png", "volume": "1 kg", "price": "\$2.99"},
    {"name": "Tomato", "image": "lib/assets/images/vegetables.png", "volume": "1 kg", "price": "\$1.50"},
    {"name": "Carrot", "image": "lib/assets/images/vegetables.png", "volume": "1 kg", "price": "\$1.99"},
    {"name": "Milk", "image": "lib/assets/images/vegetables.png", "volume": "1 liter", "price": "\$0.99"},
    {"name": "Eggs", "image": "lib/assets/images/vegetables.png", "volume": "12 pcs", "price": "\$3.99"},
    {"name": "Bread", "image": "lib/assets/images/vegetables.png", "volume": "500 gm", "price": "\$2.50"},
    {"name": "Butter", "image": "lib/assets/images/vegetables.png", "volume": "250 gm", "price": "\$3.80"},
    {"name": "Banana", "image": "lib/assets/images/vegetables.png", "volume": "1 dozen", "price": "\$2.20"},
    {"name": "Potato", "image": "lib/assets/images/vegetables.png", "volume": "2 kg", "price": "\$1.80"},
    {"name": "Onion", "image": "lib/assets/images/vegetables.png", "volume": "1 kg", "price": "\$1.60"},
    {"name": "Cheese", "image": "lib/assets/images/vegetables.png", "volume": "200 gm", "price": "\$4.20"},
    {"name": "Yogurt", "image": "lib/assets/images/vegetables.png", "volume": "500 gm", "price": "\$1.99"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            'Flash Sale Products',
            style: AppFonts.heading.copyWith(
              color: AppColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(), // Prevents nested scrolling issue
            itemCount: flashSaleItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 4 items per row
              childAspectRatio: 0.75, // Adjust card height
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return FlashSaleTile(
                name: flashSaleItems[index]["name"]!,
                image: flashSaleItems[index]["image"]!,
                volume: flashSaleItems[index]["volume"]!,
                price: flashSaleItems[index]["price"]!,
              );
            },
          ),
        ),
      ],
    );
  }
}


class FlashSaleTile extends StatelessWidget {
  final String name;
  final String image;
  final String volume;
  final String price;

  const FlashSaleTile({
    Key? key,
    required this.name,
    required this.image,
    required this.volume,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// **Ensure the image doesn't cause overflow**
          Flexible(
            child: Center(
              child: Image.asset(image, height: 85, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 8),

          /// **Product Name**
          Text(
            name,
            style: AppFonts.body.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            maxLines: 1, // Prevents overflow
            overflow: TextOverflow.ellipsis,
          ),

          /// **Volume**
          Text(
            volume,
            style: AppFonts.body.copyWith(fontSize: 12, color: AppColors.secondary),
          ),
            const SizedBox(height: 8),
          /// **Price & Add Button**
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
    );
  }
}
