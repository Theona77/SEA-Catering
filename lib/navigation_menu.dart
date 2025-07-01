import 'package:sea_catering/features/personalization/screens/settings/settings.dart';
import 'package:sea_catering/subscription_form.dart';

import 'package:sea_catering/utils/constants/colors.dart';
import 'package:sea_catering/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/shop/screens/home/home.dart';
import 'features/shop/screens/store/store.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
       bottomNavigationBar: Obx(
         () => NavigationBar(
           height: 80,
             elevation: 0,
             selectedIndex: controller.selectedIndex.value,
             onDestinationSelected: (index) => controller.selectedIndex.value = index,
             backgroundColor: darkMode ? TColors.darkerBlue : Colors.white,
             indicatorColor: darkMode ? TColors.white.withOpacity(0.1) : TColors.darkerBlue.withOpacity(0.1),
             destinations: const [
               NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
               NavigationDestination(icon: Icon(Iconsax.shop), label: 'Menu'),
               NavigationDestination(icon: Icon(Iconsax.heart), label: 'Subscription'),
               NavigationDestination(icon: Icon(Iconsax.user), label: 'Contact Us'),
         
             ],
         ),
       ),
       body: Obx (() =>controller.screens[controller.selectedIndex.value]),
     );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomeScreen(), const StoreScreen(), const SubscriptionForm(), const SettingScreen()];
}

