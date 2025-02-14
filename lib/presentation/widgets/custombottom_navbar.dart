import 'package:flutter/material.dart';
import 'package:groceryapp/core/utils/AppColors.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final int notificationCount;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.notificationCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
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
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          size: 28,
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
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (count > 0)
              Text(
                count.toString(),
                style: TextStyle(
                  color:isSelected ? AppColors.white : Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            SizedBox(width: 6),
            Icon(
              icon,
              size: 28,
              color: isSelected ? AppColors.white : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
