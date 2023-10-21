import 'package:go_router/go_router.dart';
import 'package:tevrozo_clone_four/screens/home_screen/home_screen.dart';
import 'package:tevrozo_clone_four/screens/login_screen/login_screen.dart';
import 'package:tevrozo_clone_four/screens/profile_screen/profile_screen.dart';
import 'package:tevrozo_clone_four/screens/shell.dart';

GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => Shell(child: child),
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);
