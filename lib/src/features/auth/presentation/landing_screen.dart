import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text("Landing Page"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                context.go("/signup");
              },
              child: const Text("SIGN UP")),
          ElevatedButton(
              onPressed: () {
                context.go("/signin");
              },
              child: const Text("SIGN IN")),
          const SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}
