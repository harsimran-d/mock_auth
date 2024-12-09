import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mock_auth/src/app.dart';
import 'package:mock_auth/src/features/auth/data/auth_repo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  await container.read(authRepoProvider.notifier).getExistingUser();
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const EagerInitialize(
        child: App(),
      ),
    ),
  );
}

class EagerInitialize extends ConsumerWidget {
  const EagerInitialize({
    required this.child,
    super.key,
  });
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return child;
  }
}
