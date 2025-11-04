import 'package:get/get.dart';

import 'package:flutter/material.dart';


import '../views/HomeView.dart';

class BottomNavController extends GetxController {
  // Reactive index tracking
  var index = 0.obs;

  // Screens to navigate between (HomeScreenView as first screen)
  final screens = [
    HomeView(),


   // ProductScreenViews(),
    //CustomerSupportView(),
   // ProfileScreenViews(),
  ];

  void changeIndex(int i) {
    index.value = i;
  }
}