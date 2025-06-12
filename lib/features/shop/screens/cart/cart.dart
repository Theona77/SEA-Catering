import 'package:appppppp/common/widgets/texts/product_price_text.dart';
import 'package:appppppp/common/widgets/texts/product_title_text.dart';
import 'package:appppppp/common/widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:appppppp/features/shop/screens/cart/widgets/add_remove_button.dart';
import 'package:appppppp/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/icon/t_circular_icon.dart';
import '../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

import '../../../../utils/helpers/helper_functions.dart';
import '../checkout/widgets/checkout.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),

        /// -- Items in Cart
        child: TCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: Text('Checkout \$272.0')),
      ),
    );
  }

}

