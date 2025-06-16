import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appppppp/features/authentication/controllers/user/userController.dart';
import 'package:appppppp/common/widgets/images/t_circular_image.dart';
import 'package:appppppp/utils/constants/image_strings.dart';
import 'package:appppppp/utils/constants/sizes.dart';
import 'package:appppppp/utils/constants/colors.dart';

class TUserProfileTile extends StatelessWidget {
  final VoidCallback onPressed;

  const TUserProfileTile({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;

    return Obx(() {
      final user = userController.user.value;

      return ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        leading: TCircularImage(
          image: user.profilePicture.isNotEmpty ? user.profilePicture : TImages.user,
          width: 60,
          height: 60,
          padding: 0,
          backgroundColor: TColors.white,
        ),
        title: Text(
          user.fullName.isNotEmpty ? user.fullName : "No Name",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: TColors.white,
          ),
        ),
        subtitle: Text(
          user.email.isNotEmpty ? user.email : "No Email",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 12,
            color: TColors.white.withOpacity(0.8),
          ),
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Icon(Icons.edit, color: TColors.white),
        onTap: onPressed,
      );
    });
  }
}
