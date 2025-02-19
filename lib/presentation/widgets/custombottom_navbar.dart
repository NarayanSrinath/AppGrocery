import 'package:flutter/material.dart';
import 'package:groceryapp/core/utils/AppColors.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final int notificationCount;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25, left: 15, right: 15), // Increased bottom padding
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12), // Slightly increased vertical padding
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 0), // 🏠 Home
            _buildNavItem(Icons.shopping_bag, 1), // 📦 Orders
            _buildNotificationItem(Icons.notifications, 2, notificationCount), // 🔔 Notifications
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 24,
          color: isSelected ? AppColors.white : Colors.grey,
        ),
      ),
    );
  }

  Widget _buildNotificationItem(IconData icon, int index, int count) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (count > 0)
              Text(
                count.toString(),
                style: TextStyle(
                  color: isSelected ? AppColors.white : Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            const SizedBox(width: 4),
            Icon(
              icon,
              size: 24,
              color: isSelected ? AppColors.white : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
