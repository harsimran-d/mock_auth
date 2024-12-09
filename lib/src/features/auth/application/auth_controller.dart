import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/auth_repo.dart';
import '../domain/app_user.dart';

class AuthController extends Notifier<AppUser?> {
  @override
  AppUser? build() {
    return ref.watch(authRepoProvider);
  }
}

final authControllerProvider = NotifierProvider<AuthController, AppUser?>(() {
  return AuthController();
});
