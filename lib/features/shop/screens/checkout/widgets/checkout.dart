import 'package:appppppp/common/widgets/success_screen/success_screen.dart';
import 'package:appppppp/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:appppppp/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:appppppp/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:appppppp/navigation_menu.dart';
import 'package:appppppp/rounded_container.dart';
import 'package:appppppp/utils/constants/colors.dart';
import 'package:appppppp/utils/constants/enums.dart';
import 'package:appppppp/utils/constants/image_strings.dart';
import 'package:appppppp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../../utils/constants/sizes.dart';
import 'billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Coupon TextField
              TCouponCode() ,
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    /// pricing
                    const TBillingAmountSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// divider
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// payment methods
                    const TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    /// adress
                    const TBillingAddressSection(),
                  ],
                ),
              )
          ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
                () => SuccessScreen(
                  image: TImages.succesfullpayment,
                  title: 'Payment Success!',
                  subTitle: 'Your item will be shipped soon!',
                  onPressed: () => Get.offAll(() => const NavigationMenu()),
                  ),
          ),
          child: const Text('Checkout Rp 36.000'),
        ),
      ),
    );
  }
}