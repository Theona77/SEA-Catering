import 'package:appppppp/common/widgets/appbar/appbar.dart';
import 'package:appppppp/common/widgets/images/t_circular_image.dart';
import 'package:appppppp/common/widgets/texts/section_heading.dart';
import 'package:appppppp/features/authentication/controllers/user/userController.dart';
import 'package:appppppp/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      body: Obx(() {
        final user = userController.user.value;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Profile Picture
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      TCircularImage(
                        image: user.profilePicture.isNotEmpty
                            ? user.profilePicture
                            : TImages.user,
                        width: 80,
                        height: 80,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Change Profile Picture'))
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// Profile Info
                const TSectionHeading(
                  title: 'Profile Information',
                  showActionButton: false,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                TProfileMenu(
                    title: 'Name',
                    value: '${user.firstName} ${user.lastName}',
                    onPressed: () {}),
                TProfileMenu(
                    title: 'Username',
                    value: user.username,
                    onPressed: () {}),

                const SizedBox(height: TSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// Personal Info
                const TSectionHeading(
                  title: 'Personal Information',
                  showActionButton: false,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                TProfileMenu(
                    title: 'User ID',
                    value: user.id,
                    icon: Iconsax.copy,
                    onPressed: () {}),
                TProfileMenu(
                    title: 'E-mail',
                    value: user.email,
                    onPressed: () {}),
                TProfileMenu(
                    title: 'Phone Number',
                    value: user.phoneNumber,
                    onPressed: () {}),
                TProfileMenu(
                    title: 'Gender',
                    value: 'Not set',
                    onPressed: () {}),
                TProfileMenu(
                    title: 'Date of Birth',
                    value: 'Not set',
                    onPressed: () {}),

                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),

                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Delete Account',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}