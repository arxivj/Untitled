import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/theme_provider.dart';

class FirstTabScreen extends StatelessWidget {
  const FirstTabScreen({Key? key}) : super(key: key);

  Widget _buildItem(BuildContext context, int index) {
    if (index.isEven) {
      String title = "Section $index";
      String content =
          "Apple Inc. is an American multinational technology company that specializes in consumer electronics, computer software, and online services. Content for section $index. This is a placeholder.";
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Divider(
          height: 6,
          thickness: 6,
          color: themeProvider.themeMode == ThemeMode.light
              ? Color(0xFFEEEEEE)
              : Color(0xFF202020),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 56),
        Expanded(
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) => _buildItem(context, index),
          ),
        ),
      ],
    );
  }
}
