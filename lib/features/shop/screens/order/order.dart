import 'package:sea_catering/common/widgets/appbar/appbar.dart';
import 'package:sea_catering/features/shop/screens/order/widgets/order_list.dart';
import 'package:sea_catering/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      /// -- Body
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        /// Orders
        child: TOrderListItems(),
      ),
    );
  }
}
