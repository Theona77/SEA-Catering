import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sea_catering/rounded_container.dart';
import 'package:sea_catering/common/widgets/appbar/appbar.dart';
import 'package:sea_catering/utils/constants/colors.dart';
import 'package:sea_catering/utils/constants/sizes.dart';
import 'add_bew_address.dart';
import 'widgets/single_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of dummy addresses (can be from API or local DB later)
    final List<Map<String, dynamic>> addressList = [
      {
        'name': 'Brian',
        'phone': '+62 8123456789',
        'address': 'Cikarang, Jawa Barat',
        'selected': true,
      },
      {
        'name': 'Theona',
        'phone': '+62 8122321780',
        'address': 'Bandung, Jawa Barat',
        'selected': false,
      },
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: TColors.white),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: addressList.map((data) {
              return TSingleAddress(
                selectedAddress: data['selected'],
                name: data['name'],
                phone: data['phone'],
                address: data['address'],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
