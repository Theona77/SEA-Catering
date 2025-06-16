import 'package:appppppp/features/authentication/controllers/order/orderController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appppppp/common/widgets/appbar/appbar.dart';
import 'package:appppppp/common/widgets/products/cart/coupon_widget.dart';
import 'package:appppppp/common/widgets/success_screen/success_screen.dart';
import 'package:appppppp/features/authentication/controllers/cart/CartController.dart';
import 'package:appppppp/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:appppppp/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:appppppp/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:appppppp/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:appppppp/navigation_menu.dart';
import 'package:appppppp/rounded_container.dart';
import 'package:appppppp/utils/constants/colors.dart';
import 'package:appppppp/utils/constants/image_strings.dart';
import 'package:appppppp/utils/constants/sizes.dart';
import 'package:appppppp/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;

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
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: const [
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    TBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// -- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Obx(() {
          final total = cartController.totalPrice;
          return ElevatedButton(
            onPressed: () {
              if (total > 0) {
                final orderController = Get.find<OrderController>();
                final cartItems = cartController.cartItems.values.toList();

                orderController.addOrders(cartItems.map((item) => OrderItem(
                  id: item.id,
                  title: item.title,
                  brand: item.brand,
                  image: item.image,
                  price: item.price,
                  quantity: item.quantity,
                  orderDate: DateTime.now(),
                )).toList());

                cartController.clearCart();

                Get.to(() => SuccessScreen(
                  image: TImages.succesfullpayment,
                  title: 'Payment Success!',
                  subTitle: 'Your item will be shipped soon!',
                  onPressed: () => Get.offAll(() => const NavigationMenu()),
                ));
              } else {
                Get.snackbar('Cart Empty', 'Add some products before checkout.');
              }
            },

            child: Text('Checkout Rp ${total.toStringAsFixed(0)}'),
          );
        }),
      ),
    );
  }
}
