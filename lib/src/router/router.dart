import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mock_auth/src/features/auth/application/auth_controller.dart';
import 'package:mock_auth/src/features/auth/presentation/landing_screen.dart';
import 'package:mock_auth/src/features/auth/presentation/signin_screen.dart';
import 'package:mock_auth/src/features/auth/presentation/signup_screen.dart';
import 'package:mock_auth/src/features/home/presentation/home_screen.dart';

final goRouterProvider = Provider<GoRouter>((Ref ref) {
  return GoRouter(
    redirect: (context, state) {
      final user = ref.watch(authControllerProvider);
      final List<String> nonAuthPaths = ["/signup", "/signin", "/"];
      final List<String> authPaths = ["/home"];
      if (user == null && authPaths.contains(state.uri.path)) {
        print("unauthenticateed user tried to go to home ");
        return "/";
      } else if (user != null && nonAuthPaths.contains(state.uri.path)) {
        print("Signed in user tried to go to ${state.uri.path}");
        return "/home";
      }
      return null;
    },
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const LandingScreen(),
        routes: [
          GoRoute(
            path: "signup",
            builder: (context, state) => const SignupScreen(),
          ),
          GoRoute(
            path: "signin",
            builder: (context, state) => const SigninScreen(),
          ),
        ],
      ),
      GoRoute(
        path: "/home",
        builder: (context, state) => const HomeScreen(),
      )
    ],
  );
});
