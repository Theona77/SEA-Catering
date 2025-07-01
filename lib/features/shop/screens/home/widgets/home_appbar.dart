import 'package:sea_catering/features/shop/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text("How's your day?", style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.white)),
          Obx(() => Text (
            controller.user.value.fullName.isNotEmpty ? controller.user.value.fullName : 'Loading...',
            style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),
          )),
        ],
      ),
      actions: [
        TCartCounterIcon(onPressed: () {}, iconColor: TColors.white)],
    );
  }
}

