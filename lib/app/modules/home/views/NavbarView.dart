import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/BottomNavController.dart';

import '../../../routes/app_pages.dart';

class BottomnavbarView extends GetView<BottomNavController> {
  const BottomnavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller once (it's already initialized in BottomNavController)
    final BottomNavController controller = Get.put(BottomNavController());

    // Define the navigation items
    List<BottomNavigationBarItem> navItems(int current) => [
      BottomNavigationBarItem(
        icon: ImageIcon(
          const AssetImage('assets/home/nab/home.png'),
          size: 24,
          color: current == 0 ? Colors.blue : Colors.grey,  // Change colors based on selection
        ),
        label: "Home",  // You can add labels here
      ),

      BottomNavigationBarItem(
        icon: ImageIcon(
          const AssetImage('assets/home/nab/services.png'),
          size: 24,
          color: current == 2 ? Colors.blue : Colors.grey,  // Change colors based on selection
        ),
        label: "Add",
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          const AssetImage('assets/home/nab/activity.png'),
          size: 24,
          color: current == 3 ? Colors.blue : Colors.grey,  // Change colors based on selection
        ),
        label: "Messages",
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          const AssetImage('assets/home/nab/account.png'),
          size: 24,
          color: current == 4 ? Colors.blue : Colors.grey,  // Change colors based on selection
        ),
        label: "Profile",
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        // Use the index to show the corresponding screen
        return controller.screens[controller.index.value];
      }),
      bottomNavigationBar: Container(
        height: 70,  // Set the height of the bottom nav
        child: BottomNavigationBar(
          currentIndex: controller.index.value,
          items: navItems(controller.index.value),
          onTap: controller.changeIndex,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.blue,  // Add color when an item is selected
          unselectedItemColor: Colors.grey,  // Add color for unselected items
        ),
      ),
    );
  }
}
