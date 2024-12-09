import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mock_auth/src/features/auth/application/auth_controller.dart';
import 'package:mock_auth/src/features/auth/data/auth_repo.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text("user is ${user!.id}"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                ref.read(authRepoProvider.notifier).logout();
              },
              child: const Text("Logout")),
          ElevatedButton(
              onPressed: () {
                context.go("/");
              },
              child: const Text("Try to go landing")),
          ElevatedButton(
              onPressed: () {
                context.go("/signup");
              },
              child: const Text("Try to go signup ")),
        ],
      )),
    );
  }
}
