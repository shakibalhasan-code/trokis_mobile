import 'package:get/get_navigation/get_navigation.dart';
import 'package:trokis_mobile/views/screens/auth/forgot_pass_screen.dart';
import 'package:trokis_mobile/views/screens/auth/sign_in_screen.dart';
import 'package:trokis_mobile/views/screens/initial_screen/splash_screen.dart';
import 'package:trokis_mobile/views/screens/initial_screen/user_role_screen.dart';
import 'package:trokis_mobile/views/screens/main_tab_screen.dart';
import 'package:trokis_mobile/views/screens/user/item_selection/item_selections_screen.dart';
import 'package:trokis_mobile/views/screens/user/moving/available_movers/available_movers_screen.dart';
import 'package:trokis_mobile/views/screens/user/moving/get_prices_screen.dart';
import 'package:trokis_mobile/views/screens/user/moving/moving_review_screen.dart';
import 'package:trokis_mobile/views/screens/user/starting_location/starting_location_screen.dart';

class AppRoute {
  static const String splash = '/splash';
  static const String role = '/role';
  static const String login = '/login';
  static const String forgot = '/forgot';
  static const String tab = '/tab';
  static const String startingLocation = '/startingLocation';
  static const String itemSelection = '/itemSelection';
  static const String movingReview = '/movingReview';
  static const String getPrices = '/getPrices';
  static const String availableMovers = '/availableMovers';

  static final List<GetPage> pages = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: role, page: () => const UserRoleScreen()),
    GetPage(name: login, page: () => SignInScreen()),
    GetPage(name: forgot, page: () => const ForgotPassScreen()),
    GetPage(name: tab, page: () => MainTabScreen()),
    GetPage(name: startingLocation, page: () => StartingLocationScreen()),
    GetPage(name: itemSelection, page: () => ItemSelectionsScreen()),
    GetPage(name: movingReview, page: () => MovingReviewScreen()),
    GetPage(name: getPrices, page: () => const GetPricesScreen()),
    GetPage(name: availableMovers, page: () => AvailableMoversScreen()),
  ];
}
