// Clean and Duplicate-Free Full Product List for SEA Catering
// Categories strictly separated, prices adjusted to Indonesian market, IDs standardized

import 'package:sea_catering/utils/constants/image_strings.dart';

final List<Map<String, String>> allProducts = [
  // --- Drinks
  {'id': 'drink001', 'title': 'Mixed Berry Smoothie', 'brand': 'Protein', 'price': 'Rp 30.000', 'image': TImages.mixedberry_smoothie},
  {'id': 'drink002', 'title': 'Apple Juice', 'brand': 'Protein', 'price': 'Rp 25.000', 'image': TImages.apple_juice},
  {'id': 'drink003', 'title': 'Avocado Juice', 'brand': 'Diet', 'price': 'Rp 28.000', 'image': TImages.avocado_juice},
  {'id': 'drink004', 'title': 'Cucumber Mint Smoothie', 'brand': 'Royal', 'price': 'Rp 27.000', 'image': TImages.cucumber_mint_smoothie},
  {'id': 'drink005', 'title': 'Cucumber Watermelon', 'brand': 'Royal', 'price': 'Rp 29.000', 'image': TImages.cucumber_watermelon},
  {'id': 'drink006', 'title': 'Detox', 'brand': 'Royal', 'price': 'Rp 25.000', 'image': TImages.detox},
  {'id': 'drink007', 'title': 'Dragon Fruit Smoothie', 'brand': 'Protein', 'price': 'Rp 30.000', 'image': TImages.dragonfruit_smoothie},
  {'id': 'drink008', 'title': 'Lemonade', 'brand': 'Royal', 'price': 'Rp 20.000', 'image': TImages.lemonnade},
  {'id': 'drink009', 'title': 'Orange Juice', 'brand': 'Royal', 'price': 'Rp 22.000', 'image': TImages.orange_juice},
  {'id': 'drink010', 'title': 'Peanut Banana Smoothie', 'brand': 'Royal', 'price': 'Rp 30.000', 'image': TImages.peanut_banana_smoothie},
  {'id': 'drink011', 'title': 'Soy Milk', 'brand': 'Diet', 'price': 'Rp 15.000', 'image': TImages.soymilk},
  {'id': 'drink012', 'title': 'Summer Mango Smoothie', 'brand': 'Protein', 'price': 'Rp 28.000', 'image': TImages.summer_mango_smoothie},

  // --- Snacks
  {'id': 'snack001', 'title': 'Greek Yoghurt Banana', 'brand': 'Protein', 'price': 'Rp 25.000', 'image': TImages.greek_yoghurt_banana},
  {'id': 'snack002', 'title': 'Mango Coconut Chia Seed Pudding', 'brand': 'Royal', 'price': 'Rp 30.000', 'image': TImages.mango_coconut_chiaseed_pudding},
  {'id': 'snack003', 'title': 'Waffle Skewers', 'brand': 'Diet', 'price': 'Rp 28.000', 'image': TImages.waffle_skewers},
  {'id': 'snack004', 'title': 'Rainbow Fruit Skewers', 'brand': 'Protein', 'price': 'Rp 30.000', 'image': TImages.rainbow_fruit_skewers},
  {'id': 'snack005', 'title': 'Pancake Strawberry Blueberry', 'brand': 'Royal', 'price': 'Rp 32.000', 'image': TImages.pancake_strawberry_blueberry},
  {'id': 'snack006', 'title': 'Oatmeal Cookie', 'brand': 'Royal', 'price': 'Rp 18.000', 'image': TImages.oatmeal_cookie},
  {'id': 'snack007', 'title': 'Dimsum Siomay', 'brand': 'Diet', 'price': 'Rp 22.000', 'image': TImages.dimsum_siumai},
  {'id': 'snack008', 'title': 'Crispy Garlic French Fries', 'brand': 'Royal', 'price': 'Rp 25.000', 'image': TImages.crispy_garlic_frenchfries},
  {'id': 'snack009', 'title': 'Chocolate Chia Pudding', 'brand': 'Royal', 'price': 'Rp 20.000', 'image': TImages.chocolate_chia_pudding},
  {'id': 'snack010', 'title': 'Blueberry Yoghurt Toast', 'brand': 'Royal', 'price': 'Rp 28.000', 'image': TImages.blueberry_yoghurt_toast},

  // --- Soups
  {'id': 'soup001', 'title': 'Lentil Soup', 'brand': 'Royal', 'price': 'Rp 30.000', 'image': TImages.lentil_soup},
  {'id': 'soup002', 'title': 'Wonton Soup', 'brand': 'Royal', 'price': 'Rp 35.000', 'image': TImages.wonton_soup},
  {'id': 'soup003', 'title': 'Sweet Potato Soup', 'brand': 'Diet', 'price': 'Rp 32.000', 'image': TImages.sweet_potato_soup},
  {'id': 'soup004', 'title': 'Potato Leek Soup', 'brand': 'Diet', 'price': 'Rp 32.000', 'image': TImages.potato_leak_soup},
  {'id': 'soup005', 'title': 'Pho', 'brand': 'Royal', 'price': 'Rp 40.000', 'image': TImages.pho},
  {'id': 'soup006', 'title': 'Japanese Miso Soup', 'brand': 'Royal', 'price': 'Rp 28.000', 'image': TImages.japanese_miso_soup},
  {'id': 'soup007', 'title': 'Egg Drop Soup', 'brand': 'Protein', 'price': 'Rp 35.000', 'image': TImages.egg_drop_soup},
  {'id': 'soup008', 'title': 'Creamy Cauliflower Soup', 'brand': 'Diet', 'price': 'Rp 28.000', 'image': TImages.creamy_cauliflower_soup},
  {'id': 'soup009', 'title': 'Creamy Mushroom Soup', 'brand': 'Diet', 'price': 'Rp 28.000', 'image': TImages.creamy_mushroom_soup},
  {'id': 'soup010', 'title': 'Chicken Soup', 'brand': 'Protein', 'price': 'Rp 30.000', 'image': TImages.chicken_soup},

  // --- Vegetables
  {'id': 'veg001', 'title': 'Balsamic Spinach', 'brand': 'Diet', 'price': 'Rp 25.000', 'image': TImages.balsamic_spinach},
  {'id': 'veg002', 'title': 'Bokchoy Garlic', 'brand': 'Diet', 'price': 'Rp 25.000', 'image': TImages.bokchoy_garlic},
  {'id': 'veg003', 'title': 'Cabbage Salad', 'brand': 'Diet', 'price': 'Rp 22.000', 'image': TImages.cabbage_salad},
  {'id': 'veg004', 'title': 'Caprese Salad', 'brand': 'Diet', 'price': 'Rp 28.000', 'image': TImages.caprese_salad},
  {'id': 'veg005', 'title': 'Celery Salad Apple', 'brand': 'Diet', 'price': 'Rp 20.000', 'image': TImages.celerysalad_apple},
  {'id': 'veg006', 'title': 'Corn Steamed', 'brand': 'Diet', 'price': 'Rp 18.000', 'image': TImages.corn_steamed},
  {'id': 'veg007', 'title': 'Parmesan Brussel Sprout', 'brand': 'Diet', 'price': 'Rp 28.000', 'image': TImages.parmesan_brussel_sprout},
  {'id': 'veg008', 'title': 'Roasted Cauliflower', 'brand': 'Diet', 'price': 'Rp 25.000', 'image': TImages.roasted_cauliflower},
  {'id': 'veg009', 'title': 'Roasted Garlic Mushroom', 'brand': 'Diet', 'price': 'Rp 28.000', 'image': TImages.roasted_garlic_mushroom},
  {'id': 'veg010', 'title': 'Roasted Greenbeans', 'brand': 'Diet', 'price': 'Rp 22.000', 'image': TImages.roasted_greenbeans},
  {'id': 'veg011', 'title': 'Sauteed Carrots', 'brand': 'Diet', 'price': 'Rp 20.000', 'image': TImages.sauteed_carrots},

  // --- Quick
  {'id': 'quick001', 'title': 'Oatmeal Blueberry', 'brand': 'Protein', 'price': 'Rp 30.000', 'image': TImages.oatmeal_blueberry},
  {'id': 'quick002', 'title': 'Fried Rice', 'brand': 'Protein', 'price': 'Rp 35.000', 'image': TImages.fried_rice},
  {'id': 'quick003', 'title': 'Grilled Halloumi Salad', 'brand': 'Royal', 'price': 'Rp 40.000', 'image': TImages.grilled_halloumi_salad},
  {'id': 'quick004', 'title': 'Mung Bean Porridge', 'brand': 'Diet', 'price': 'Rp 25.000', 'image': TImages.mung_bean_porridge},
  {'id': 'quick005', 'title': 'High Protein Oatmeal', 'brand': 'Protein', 'price': 'Rp 32.000', 'image': TImages.high_protein_oatmeal},
  {'id': 'quick006', 'title': 'Pancake Strawberry Blueberry', 'brand': 'Royal', 'price': 'Rp 35.000', 'image': TImages.pancake_strawberry_blueberry},
  {'id': 'quick007', 'title': 'Eggplant Garlic Sauce', 'brand': 'Diet', 'price': 'Rp 27.000', 'image': TImages.eggplant_garlicsauce},
  {'id': 'quick008', 'title': 'Yellow Rice', 'brand': 'Diet', 'price': 'Rp 20.000', 'image': TImages.yellowrice},
  {'id': 'quick009', 'title': 'Turkey Avocado Wrap', 'brand': 'Royal', 'price': 'Rp 38.000', 'image': TImages.turkey_avocado_wrap},
  {'id': 'quick010', 'title': 'Es Dawet Sugarfree', 'brand': 'Diet', 'price': 'Rp 22.000', 'image': TImages.es_dawet_sugarfree},
  {'id': 'quick011', 'title': 'Stir Fry Kwetiau', 'brand': 'Royal', 'price': 'Rp 37.000', 'image': TImages.stir_fry_kwetiau},
  {'id': 'quick012', 'title': 'Mushroom Pie', 'brand': 'Diet', 'price': 'Rp 29.000', 'image': TImages.mushroom_pie},
];
