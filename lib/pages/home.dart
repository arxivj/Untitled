import 'package:flutter/material.dart';
import 'package:untitled/pages/navigator_test_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Home Page',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const NavigatorTestPage(),
                ),
              );
            },
            icon: const Icon(Icons.home, size: 100, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
