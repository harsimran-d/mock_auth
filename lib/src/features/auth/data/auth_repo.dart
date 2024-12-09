import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../domain/app_user.dart';

class AuthRepo extends Notifier<AppUser?> {
  AuthRepo();
  final String userKey = "user";
  @override
  AppUser? build() {
    getExistingUser();
    return null;
  }

  Future<void> signup() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final user = AppUser(id: "signup");
    await ref.read(_ssProvider).write(key: userKey, value: user.id);
    state = user;
  }

  Future<void> signin() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final user = AppUser(id: "signin");
    await ref.read(_ssProvider).write(key: userKey, value: user.id);
    state = user;
  }

  Future<void> getExistingUser() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final id = await ref.read(_ssProvider).read(key: userKey);
    if (id == null) {
      state = null;
    } else {
      final user = AppUser(id: id);
      state = user;
    }
  }

  Future<void> logout() async {
    await ref.read(_ssProvider).delete(key: userKey);
    state = null;
  }
}

final authRepoProvider = NotifierProvider<AuthRepo, AppUser?>(() {
  return AuthRepo();
});

final _ssProvider = Provider<FlutterSecureStorage>((_) {
  return const FlutterSecureStorage();
});
