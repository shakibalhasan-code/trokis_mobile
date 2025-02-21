import 'package:get/get_navigation/get_navigation.dart';
import 'package:trokis_mobile/views/screens/auth/forgot_pass_screen.dart';
import 'package:trokis_mobile/views/screens/auth/sign_in_screen.dart';
import 'package:trokis_mobile/views/screens/initial_screen/splash_screen.dart';
import 'package:trokis_mobile/views/screens/initial_screen/user_role_screen.dart';
import 'package:trokis_mobile/views/screens/main_tab_screen.dart';
import 'package:trokis_mobile/views/screens/user/starting_location/starting_location_screen.dart';

class AppRoute {
  static const String splash = '/splash';
  static const String role = '/role';
  static const String login = '/login';
  static const String forgot = '/forgot';
  static const String tab = '/tab';
  static const String startingLocation = '/startingLocation';

  static final List<GetPage> pages = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: role, page: () => const UserRoleScreen()),
    GetPage(name: login, page: () => const SignInScreen()),
    GetPage(name: forgot, page: () => const ForgotPassScreen()),
    GetPage(name: tab, page: () =>  MainTabScreen()),
    GetPage(name: startingLocation, page: () =>   StartingLocationScreen()),
  ];
}
