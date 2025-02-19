import 'package:flutter/material.dart';
import 'package:groceryapp/core/utils/AppColors.dart';

class SideNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const SideNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.secondary,
        child: Column(
          children: [
            const DrawerHeader(
              curve: Curves.easeIn,
              
              decoration: BoxDecoration(color: AppColors.secondary),
              child: Center(
                child: Text('Menu', style: TextStyle(color: Colors.black, fontSize: 24)),
              ),
            ),
            _buildNavItem(Icons.home, 'Home', 0),
            _buildNavItem(Icons.category, 'Categories', 1),
            _buildNavItem(Icons.person, 'Profile', 2),
            _buildNavItem(Icons.settings, 'Settings', 3),
            _buildNavItem(Icons.description, 'Terms & Conditions', 4),
            _buildNavItem(Icons.policy, 'Policies', 5),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String title, int index) {
    bool isSelected = selectedIndex == index;
    return ListTile(
      leading: Icon(icon, color: isSelected ? AppColors.primary : Colors.black),
      title: Text(title, style: TextStyle(color: isSelected ? AppColors.primary : Colors.black)),
      onTap: () => onItemTapped(index),
    );
  }
}
