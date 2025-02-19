import 'package:flutter/material.dart';
import 'package:groceryapp/presentation/screens/nav%20screens/home_page.dart';
import 'package:groceryapp/presentation/widgets/%20side_navbar.dart';
import 'package:groceryapp/presentation/widgets/custombottom_navbar.dart';
import 'package:groceryapp/presentation/widgets/showAddressBottomSheet.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _bottomNavIndex = 0; // Index for bottom nav
  int _sideNavIndex = 0; // Index for side nav
  final int _notificationCount = 5; // Example notification count

    @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showAddressBottomSheet(context);
    });
  }
// Bottom Navigation Screens
final List<Widget> _bottomScreens = [
  Homepage(),
  Container(),
  Container(),
];

// Side Navigation Screens
final List<Widget> _sideScreens = [
  Container(), // Common with Bottom Nav
  Container(),
  Container(),
  Container(),
  Container(),
  Container(),
];


  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
      _sideNavIndex = 0; // Reset side nav when bottom nav changes
    });
  }

  void _onSideNavTapped(int index) {
    setState(() {
      _sideNavIndex = index;
      _bottomNavIndex = 0; // Reset bottom nav when side nav changes
      Navigator.pop(context); // Close drawer if opened
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: SideNavBar(
        selectedIndex: _sideNavIndex,
        onItemTapped: _onSideNavTapped,
      ),
      body: _sideNavIndex == 0 ? _bottomScreens[_bottomNavIndex] : _sideScreens[_sideNavIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _bottomNavIndex,
        onItemTapped: _onBottomNavTapped,
        notificationCount: _notificationCount,
      ),
    );
  }
}
