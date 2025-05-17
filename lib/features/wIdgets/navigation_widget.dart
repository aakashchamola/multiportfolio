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

  void _showMoreModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Education'),
              onTap: () => {onItemSelected(3), Navigator.pop(context)},
            ),
            ListTile(
              leading: const Icon(Icons.folder),
              title: const Text('Projects'),
              onTap: () => {onItemSelected(6), Navigator.pop(context)},
            ),
            ListTile(
              leading: const Icon(Icons.badge),
              title: const Text('Certifications'),
              onTap: () => {onItemSelected(4), Navigator.pop(context)},
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Skills'),
              onTap: () => {onItemSelected(5), Navigator.pop(context)},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex > 3 ? 3 : selectedIndex,
      onTap: (index) {
        if (index == 3) {
          _showMoreModal(context);
        } else if (index < 3) {
          onItemSelected(index);
        }
      },
      backgroundColor: Colors.white,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey.shade600,
      selectedFontSize: 14,
      unselectedFontSize: 12,
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work),
          label: 'Experience',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: 'More',
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
