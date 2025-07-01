import 'package:sea_catering/common/widgets/appbar/appbar.dart';
import 'package:sea_catering/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:sea_catering/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:sea_catering/common/widgets/texts/section_heading.dart';
import 'package:sea_catering/data/repositories.authentication/authentication_repository.dart';
import 'package:sea_catering/features/shop/screens/cart/cart.dart';
import 'package:sea_catering/features/shop/screens/order/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../admin_dashboard_screen.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../subscription_screen.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../address/address.dart';
import '../profile/widgets/profile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// --- Header
            TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    TAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),
                    const SizedBox(height: TSizes.spaceBtwSections),


                    ///User Profile Card
                    TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                )
            ),

            /// Body
            Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [

                    /// --- Account Settings
                    const TSectionHeading(title: 'Account Settings', showActionButton: false,),
                    SizedBox(height: TSizes.spaceBtwItems),

                    TSettingsMenuTile(
                        icon: Iconsax.safe_home,
                        title: 'My Addresses',
                        subtitle: 'Set Shopping delivery',
                        onTap: ()=> Get.to(() => const UserAddressScreen()),
                    ),
                    TSettingsMenuTile(
                        icon: Iconsax.shopping_cart,
                        title: 'My Cart',
                        subtitle: 'Add, remove products and move to checkout',
                        onTap: () => Get.to(() => const CartScreen()),
                    ),
                    TSettingsMenuTile(
                        icon: Iconsax.bag_tick,
                        title: 'My Orders',
                        subtitle: 'On progress and Completed Orders',
                        onTap: () => Get.to(() => const OrderScreen()),
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.calendar_1,
                      title: 'My Subscriptions',
                      subtitle: 'Manage your meal plan subscription',
                      onTap: () => Get.to(() => const SubscriptionScreen()),
                    ),
                    TSettingsMenuTile(
                        icon: Iconsax.bank,
                        title: 'Bank Account',
                        subtitle: 'Withdraw balance to registered bank account',
                        onTap: (){}
                    ),
                    TSettingsMenuTile(
                        icon: Iconsax.discount_shape,
                        title: 'My Vouchers',
                        subtitle: 'List of all discounted vouchers',
                        onTap: (){}
                    ),
                    TSettingsMenuTile(
                        icon: Iconsax.notification,
                        title: 'Notifications',
                        subtitle: 'Set any kind of notification message',
                        onTap: (){}
                    ),
                    TSettingsMenuTile(
                        icon: Iconsax.security_card,
                        title: 'Account Privacy',
                        subtitle: 'Manage data usage and connected accounts',
                        onTap: (){}
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.chart_2,
                      title: 'Admin Dashboard',
                      subtitle: 'View subscription insights',
                      onTap: () => Get.to(() => const AdminDashboardScreen()),
                    ),


                    /// -- App Settings
                    SizedBox(height: TSizes.spaceBtwSections),
                    TSectionHeading(title: 'App Settings', showActionButton: false,),
                    SizedBox(height: TSizes.spaceBtwItems),
                    TSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load data', subtitle: 'Upload data to your Cloud Firebase'),
                    TSettingsMenuTile(
                        icon: Iconsax.location,
                        title: 'Geolocation',
                        subtitle: 'Set recommendation based on location',
                        trailing: Switch(value: true, onChanged: (value){}),
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Safe Mode',
                      subtitle: 'Search result is safe for all ages',
                      trailing: Switch(value: false, onChanged: (value){}),
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.image,
                      title: 'HD Image Quality',
                      subtitle: 'Set image quality to be seen',
                      trailing: Switch(value: false, onChanged: (value){}),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          await AuthenticationRepository.instance.logout();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TColors.white,
                          foregroundColor: TColors.darkerGrey,
                        ),
                        child: const Text("Logout"),
                      ),
                    ),
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}
