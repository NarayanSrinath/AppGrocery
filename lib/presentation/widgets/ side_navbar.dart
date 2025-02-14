import 'package:flutter/material.dart';
import 'package:groceryapp/core/utils/AppColors.dart';

class SideNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const SideNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.black,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.black),
              child: Center(
                child: Text("Menu", style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
            ),
            _buildNavItem(Icons.home, "Home", 0),
            _buildNavItem(Icons.category, "Categories", 1),
            _buildNavItem(Icons.person, "Profile", 2),
            _buildNavItem(Icons.settings, "Settings", 3),
            _buildNavItem(Icons.description, "Terms & Conditions", 4),
            _buildNavItem(Icons.policy, "Policies", 5),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String title, int index) {
    bool isSelected = selectedIndex == index;
    return ListTile(
      leading: Icon(icon, color: isSelected ? AppColors.white : Colors.grey),
      title: Text(title, style: TextStyle(color: isSelected ? AppColors.white : Colors.grey)),
      onTap: () => onItemTapped(index),
    );
  }
}
