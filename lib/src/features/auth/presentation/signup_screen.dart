import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_auth/src/features/auth/data/auth_repo.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
            onPressed: () {
              ref.read(authRepoProvider.notifier).signup();
            },
            child: const Text("AUTO SIGNUP")),
      )),
    );
  }
}
