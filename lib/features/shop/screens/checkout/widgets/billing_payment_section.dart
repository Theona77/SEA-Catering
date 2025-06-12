import 'package:flutter/material.dart';
import 'package:appppppp/common/widgets/texts/section_heading.dart';
import 'package:appppppp/rounded_container.dart';
import 'package:appppppp/utils/constants/colors.dart';
import 'package:appppppp/utils/constants/image_strings.dart';
import 'package:appppppp/utils/constants/sizes.dart';
import 'package:appppppp/utils/helpers/helper_functions.dart';

class TBillingPaymentSection extends StatefulWidget {
  const TBillingPaymentSection({super.key});

  @override
  State<TBillingPaymentSection> createState() => _TBillingPaymentSectionState();
}

class _TBillingPaymentSectionState extends State<TBillingPaymentSection> {
  /// Default selected method
  String _selectedMethod = 'Dana';
  String _selectedImage = TImages.dana;

  /// List of payment methods
  final List<Map<String, String>> paymentMethods = [
    {'name': 'Dana', 'image': TImages.dana},
    {'name': 'BCA', 'image': TImages.bca},
    {'name': 'Mandiri', 'image': TImages.mandiri},
    {'name': 'BRI', 'image': TImages.bankbri},
    {'name': 'ShopeePay', 'image': TImages.shopeepay},
    {'name': 'Gopay', 'image': TImages.gopay},
    {'name': 'QRIS', 'image': TImages.qris},
    {'name': 'Alfamart', 'image': TImages.alfamart},
    {'name': 'Indomaret', 'image': TImages.indomaret},
    {'name': 'VISA', 'image': TImages.visa},
  ];

  /// Show modal bottom sheet for payment selection
  void _showPaymentOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: paymentMethods.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final method = paymentMethods[index];
            return ListTile(
              leading: Image.asset(method['image']!, width: 40),
              title: Text(method['name']!),
              onTap: () {
                setState(() {
                  _selectedMethod = method['name']!;
                  _selectedImage = method['image']!;
                });
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: _showPaymentOptions,
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: Image.asset(_selectedImage, fit: BoxFit.contain),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Text(
              _selectedMethod,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}
