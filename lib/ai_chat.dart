import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AIChatBox extends StatefulWidget {
  const AIChatBox({super.key});

  @override
  State<AIChatBox> createState() => _AIChatBoxState();
}

class _AIChatBoxState extends State<AIChatBox> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [
    "Hi! I'm your SEA Catering assistant. How can I help?"
  ];

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _messages.add("You: ${_controller.text.trim()}");
      _messages.add("AI: Thanks for your message! We'll get back to you.");
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "AI Chat Assistant",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),

            /// Messages
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(_messages[index]),
                ),
              ),
            ),

            /// Input Field
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration:
                    const InputDecoration(hintText: "Type your message..."),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Iconsax.send_2),
                  onPressed: _sendMessage,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
