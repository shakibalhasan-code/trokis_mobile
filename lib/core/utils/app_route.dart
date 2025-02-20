import 'package:get/get_navigation/get_navigation.dart';
import 'package:trokis_mobile/views/screens/auth/sign_in_screen.dart';
import 'package:trokis_mobile/views/screens/initial_screen/splash_screen.dart';
import 'package:trokis_mobile/views/screens/initial_screen/user_role_screen.dart';

class AppRoute {
  static const String splash = '/splash';
  static const String role = '/role';
  static const String login = '/login';

  static final List<GetPage> pages = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: role, page: () => const UserRoleScreen()),
    GetPage(name: login, page: () => const SignInScreen()),
  ];
}
