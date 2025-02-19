import 'package:flutter/material.dart';
import 'package:groceryapp/core/utils/AppColors.dart';
import 'package:groceryapp/core/utils/AppFont.dart';
import 'package:groceryapp/presentation/widgets/Flashsale_section.dart';
import 'package:groceryapp/presentation/widgets/Newarrivals_section.dart';
import 'package:groceryapp/presentation/widgets/categories_section.dart';
import 'package:groceryapp/presentation/widgets/custom_offersbanner.dart';
import 'package:groceryapp/presentation/widgets/popular_grocerysection.dart';

import '../../widgets/custom_searchbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 20% Container
          Expanded(
            flex: 1,
            child: Container(
              color: AppColors.white, // First container color
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: AppColors.primary,
                        ),
                        Text(
                          '10 mins | Vembuliaman Koil Street',
                          style: AppFonts.body.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Shop Timings 8:00 - 12:00 and 4:00 - 8:00',
                    style: AppFonts.body.copyWith(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
          // 80% Container
          Expanded(
            flex: 8,
            child: Container(
              color: AppColors.white, // Second container color
              child: SingleChildScrollView(
                // Enables scrolling
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomSearchBar(),
                      const SizedBox(height: 20),
                      const CustomOffersBanner(), // Offers Banner
                      const SizedBox(height: 20),
                      const CategoriesSection(),
                      const SizedBox(height: 20),
                      PopularGrocerySection(),
                      const SizedBox(height: 20),
                      NewArrivalsSection(),
                      const SizedBox(height: 20),
                      FlashSaleSection(),

                      const SizedBox(
                          height: 30), // Increased spacing before the quote
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Text(
                              "One app to meet all your \nneeds.",
                              style: AppFonts.heading.copyWith(
                                fontSize: 30, // Bigger text
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  height: 4,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                          height: 30), // Extra spacing after the quote
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
