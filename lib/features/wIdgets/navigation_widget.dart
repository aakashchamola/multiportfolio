// navigation_widget.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiportfolio/core/utils/constants.dart';

class NavigationWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const NavigationWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (Sizing.isDesktop(context) || Sizing.isWeb()) {
      return _buildSideNavigation(context);
    } else if (Sizing.isTablet(context)) {
      return _buildCollapsibleDrawer(context);
    } else {
      return _buildBottomNavigationBar(context);
    }
  }

  Widget _buildSideNavigation(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          _navItem(context, 0, 'Home', Icons.home),
          _navItem(context, 1, 'Profile', Icons.person),
          _navItem(context, 2, 'Experience', Icons.work),
          _navItem(context, 3, 'Education', Icons.school),
          _navItem(context, 4, 'Certification', Icons.badge),
          _navItem(context, 5, 'Skills', Icons.star),
          _navItem(context, 6, 'Projects', Icons.folder),
        ],
      ),
    );
  }

  Widget _buildCollapsibleDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Get.back(),
          ),
          Expanded(
            child: ListView(
              children: [
                _navItem(context, 0, 'Home', Icons.home),
                _navItem(context, 1, 'Profile', Icons.person),
                _navItem(context, 2, 'Experience', Icons.work),
                _navItem(context, 3, 'Education', Icons.school),
                _navItem(context, 4, 'Certification', Icons.badge),
                _navItem(context, 5, 'Skills', Icons.star),
                _navItem(context, 6, 'Projects', Icons.folder),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemSelected,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey.shade600,
      selectedFontSize: 14,
      unselectedFontSize: 12,
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      items: const [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Icon(Icons.home, size: 28),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Icon(Icons.person, size: 28),
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Icon(Icons.work, size: 28),
          ),
          label: 'Experience',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Icon(Icons.school, size: 28),
          ),
          label: 'Education',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Icon(Icons.badge, size: 28),
          ),
          label: 'Certs',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Icon(Icons.star, size: 28),
          ),
          label: 'Skills',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Icon(Icons.folder, size: 28),
          ),
          label: 'Projects',
        ),
      ],
    );
  }

  Widget _navItem(
      BuildContext context, int index, String label, IconData icon) {
    return ListTile(
      selected: index == selectedIndex,
      leading:
          Icon(icon, color: index == selectedIndex ? Colors.blue : Colors.grey),
      title: Text(label),
      onTap: () => onItemSelected(index),
    );
  }
}
