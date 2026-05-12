import 'package:go_router/go_router.dart';
import 'package:app/features/auth/presentation/screens/login_screen.dart';

import 'package:app/features/auth/presentation/screens/welcome_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
  ],
);