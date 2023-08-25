import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Center(
          child: Text("Demo Screen"),
        ),
      ),
    );
  }
}
