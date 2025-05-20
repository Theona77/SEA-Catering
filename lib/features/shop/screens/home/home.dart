import 'package:appppppp/common/widgets/appbar/appbar.dart';
import 'package:appppppp/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:appppppp/features/authentication/screens/onboarding.dart';
import 'package:appppppp/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:appppppp/utils/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    /// Appbar

                    THomeAppBar(),

                    /// Search Bar
                    ///
                    ///
                    /// Categories
                  ],
                )
            ),
          ],
        ),
      )
    );
  }
}
