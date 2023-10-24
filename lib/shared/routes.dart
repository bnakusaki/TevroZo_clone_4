import 'package:go_router/go_router.dart';
import 'package:tevrozo_clone_four/screens/home_screen/home_screen.dart';
import 'package:tevrozo_clone_four/screens/login_screen/login_screen.dart';
import 'package:tevrozo_clone_four/screens/profile_screen/profile_screen.dart';
import 'package:tevrozo_clone_four/screens/shell.dart';

class RouteNames {
  static String logInScreen = '/';
  static String home = '/home';
  static String profile = '/profile';
}

GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: RouteNames.logInScreen,
      builder: (context, state) => const LoginScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => Shell(child: child),
      routes: [
        GoRoute(
          path: '/home',
          name: RouteNames.home,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/profile',
          name: RouteNames.profile,
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);
