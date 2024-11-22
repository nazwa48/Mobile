import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});
  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue.shade700;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation Dialog Screen Nazwa'),
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text('Change Color'),
            onPressed: () {
              _showColorDialog(context);
            }),
      ),
    );
  }

  _showColorDialog(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very important question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
                child: const Text('Lime'),
                onPressed: () {
                  color = Color.fromARGB(199, 207, 245, 201);
                  Navigator.pop(context, color);
                }),
            TextButton(
                child: const Text('Tosca'),
                onPressed: () {
                  color = Color.fromARGB(230, 210, 243, 63);
                  Navigator.pop(context, color);
                }),
            TextButton(
                child: const Text('Orange'),
                onPressed: () {
                  color = Color.fromARGB(195, 255, 166, 0);
                  Navigator.pop(context, color);
                }),
          ],
        );
      },
    );
    setState(() {});
  }
}