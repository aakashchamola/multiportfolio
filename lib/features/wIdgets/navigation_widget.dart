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
    bool isMobileApp = Sizing.isMobileApp();
    bool isMobile = Sizing.isMobile(context);
    bool isTablet = Sizing.isTablet(context);
    bool isDesktop = Sizing.isDesktop(context);

    if (isMobileApp) {
      return _buildBottomNavigationBar(context);
    } else if (isMobile) {
      return _buildBottomNavigationBar(context);
    } else if (isTablet) {
      return _buildCollapsibleDrawer(context);
    } else if (isDesktop) {
      return _buildSideNavigation(context);
    }

    return _buildBottomNavigationBar(context);
  }

  Widget _buildSideNavigation(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 24),
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          ...List.generate(
            7,
            (index) =>
                _navItem(context, index, _getLabel(index), _getIcon(index)),
          ),
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
              children: List.generate(
                7,
                (index) =>
                    _navItem(context, index, _getLabel(index), _getIcon(index)),
              ),
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
    bool isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.blue : Colors.grey,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.blue : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getLabel(int index) {
    const labels = [
      'Home',
      'Profile',
      'Experience',
      'Education',
      'Certification',
      'Skills',
      'Projects'
    ];
    return labels[index];
  }

  IconData _getIcon(int index) {
    const icons = [
      Icons.home,
      Icons.person,
      Icons.work,
      Icons.school,
      Icons.badge,
      Icons.star,
      Icons.folder,
    ];
    return icons[index];
  }
}
