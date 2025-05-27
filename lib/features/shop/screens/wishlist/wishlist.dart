import 'package:appppppp/common/widgets/appbar/appbar.dart';
import 'package:appppppp/common/widgets/icon/t_circular_icon.dart';
import 'package:appppppp/common/widgets/layouts/grid_layout.dart';
import 'package:appppppp/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:appppppp/features/shop/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';

class FavoriteScreen extends StatelessWidget{
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: TAppBar(
       title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
       actions: [
         TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
       ],
     ),

     body: SingleChildScrollView(
       child: Padding(
           padding: EdgeInsets.all(TSizes.defaultSpace),
         child: Column(
           children: [
             TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical())
           ],
         ),
       ),
     ),
   );
  }
  
  
}