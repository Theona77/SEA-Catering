import 'package:appppppp/common/widgets/appbar/appbar.dart';
import 'package:appppppp/common/widgets/images/t_circular_image.dart';
import 'package:appppppp/common/widgets/texts/section_heading.dart';
import 'package:appppppp/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true, title: Text('Profile'),
      ),

      /// --- Body
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              ///Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                        image: TImages.user, width: 80, height: 80),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              /// -- Details
              const SizedBox(height: TSizes.spaceBtwItems/2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              const TSectionHeading(title: 'Profile Information', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'Name', value: 'Michelle Gabriella', onPressed: () {}),
              TProfileMenu(title: 'Username', value: 'Mikael Cikarang', onPressed: () {}),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Personal Info

              const TSectionHeading(title: 'Personal Information', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'User ID', value: '34525', icon: Iconsax.copy, onPressed: () {}),
              TProfileMenu(title: 'E-mail', value: 'michelle@binus.ac.id', onPressed: () {}),
              TProfileMenu(title: 'Phone Number', value: '+62 895-3275-02087', onPressed: () {}),
              TProfileMenu(title: 'Gender', value: 'Female', onPressed: () {}),
              TProfileMenu(title: 'Date of Birth', value: '10 10 2010', onPressed: () {}),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),

              Center(
                child: TextButton(
                    onPressed: (){},
                    child: const Text('Delete Account', style: TextStyle(color: Colors.red))),
              )

            ],
          ),
        ),
      ),
    );
  }


}

