import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second Screen Nazwa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade500, // Ganti primary menjadi backgroundColor
                ),
                child: const Text('Red'),
                onPressed: () {
                  color = Color(0xFF800000);
                  Navigator.pop(context, color);
                }),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade500, // Ganti primary menjadi backgroundColor
                ),
                child: const Text('Yellow'),
                onPressed: () {
                  color = Color.fromARGB(255, 215, 222, 6);
                  Navigator.pop(context, color);
                }),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade500, // Ganti primary menjadi backgroundColor
                ),
                child: const Text('Blue'),
                onPressed: () {
                  color = Color.fromARGB(255, 33, 6, 234);
                  Navigator.pop(context, color);
                }),
          ],
        ),
      ),
    );
  }
}
