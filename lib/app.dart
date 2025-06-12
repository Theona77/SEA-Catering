import 'package:appppppp/bindings/general_bindings.dart';
import 'package:appppppp/features/authentication/screens/onboarding.dart';
import 'package:appppppp/utils/constants/colors.dart';
import 'package:appppppp/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      /// Show loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen
      home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}

