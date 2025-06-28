import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import 'ai_chat.dart';

class AIChatButtonDemo extends StatelessWidget {
  const AIChatButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: const Text("AI Chat Demo")),
          body: const Center(child: Text("Your main content goes here")),
        ),

        /// --- Chat Button ---
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) {
                  return const AIChatBox();
                },
              );
            },
            backgroundColor: TColors.secondary,
            child: const Icon(Iconsax.message),
          ),
        ),
      ],
    );
  }
}
