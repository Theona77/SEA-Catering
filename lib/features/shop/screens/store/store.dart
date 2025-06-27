import 'package:sea_catering/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:sea_catering/common/widgets/layouts/grid_layout.dart';
import 'package:sea_catering/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:sea_catering/common/widgets/texts/section_heading.dart';
import 'package:sea_catering/features/shop/screens/store/widgets/category_tab.dart';
import 'package:sea_catering/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text("Store", style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCartCounterIcon(onPressed: (){}, iconColor: Colors.white,),
          ],
        ),
        body: NestedScrollView(headerSliverBuilder: (_, innerBoxIsScrolled){
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
              expandedHeight: 440,
      
              flexibleSpace: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    /// ---Search Bar ---
                    SizedBox(height: TSizes.spaceBtwItems),
                    TSearchContainer(text: 'Search In Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                    SizedBox(height: TSizes.spaceBtwSections),
      
                    /// --- Featured Brand ---
                    TSectionHeading(title: 'Featured Brands', onPressed: (){}),
                    const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                    /// --- Brand GRID
                    TGridLayout(itemCount: 4, mainAxisExtent: 80, itemBuilder: (_, index){
                      return const TBrandCard(showBorder: false);
                    },
                    ),
      
      
                  ],
                ),
      
              ),
              /// --- Tabs ---
              bottom: const TTabBar(
                tabs: [
                  Tab(child: Text('Nuts')),
                  Tab(child: Text('Vegetable')),
                  Tab(child: Text('Fruits')),
                  Tab(child: Text('Seeds')),
                  Tab(child: Text('Herbs')),
                ],
              ),
            ),
          ];
        }, body: const TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ]
        ),
        ),
        ),
    );
  }
}

