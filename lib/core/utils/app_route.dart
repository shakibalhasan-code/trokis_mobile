import 'package:get/get_navigation/get_navigation.dart';
import 'package:trokis_mobile/views/screens/auth/forgot_pass_screen.dart';
import 'package:trokis_mobile/views/screens/auth/sign_in_screen.dart';
import 'package:trokis_mobile/views/screens/initial_screen/splash_screen.dart';
import 'package:trokis_mobile/views/screens/initial_screen/user_role_screen.dart';
import 'package:trokis_mobile/views/screens/main_tab_screen.dart';
import 'package:trokis_mobile/views/screens/user/categories/big_item/big_item_main_screen.dart';
import 'package:trokis_mobile/views/screens/user/categories/helpers/deposti_required_screen.dart';
import 'package:trokis_mobile/views/screens/user/categories/helpers/finding_helper.dart';
import 'package:trokis_mobile/views/screens/user/categories/helpers/helper_list_screen.dart';
import 'package:trokis_mobile/views/screens/user/categories/helpers/helper_screen.dart';
import 'package:trokis_mobile/views/screens/user/categories/helpers/helper_summary_screen.dart';
import 'package:trokis_mobile/views/screens/user/categories/helpers/review_helper_request_screen.dart';
import 'package:trokis_mobile/views/screens/user/categories/pickup/pickup_main_screen.dart';
import 'package:trokis_mobile/views/screens/user/item_selection/item_selections_screen.dart';
import 'package:trokis_mobile/views/screens/user/categories/moving/available_movers/available_movers_screen.dart';
import 'package:trokis_mobile/views/screens/user/categories/moving/driver_info/driver_info_screen.dart';
import 'package:trokis_mobile/views/screens/user/categories/moving/get_prices_screen.dart';
import 'package:trokis_mobile/views/screens/user/categories/moving/mover_details/mover_details_screen.dart';
import 'package:trokis_mobile/views/screens/user/categories/moving/moving_review_screen.dart';
import 'package:trokis_mobile/views/screens/user/categories/moving/payment_method/payment_method_screen.dart';
import 'package:trokis_mobile/views/screens/user/categories/moving/summary/moving_summary_screen.dart';
import 'package:trokis_mobile/views/screens/user/categories/moving/support/support_screen.dart';
import 'package:trokis_mobile/views/screens/user/profile/profile_screen.dart';
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
  static const String moverDetails = '/moverDetailsScreen';
  static const String paymentMethod = '/paymentMethod';
  static const String driverInfo = '/driverInfo';
  static const String movingSummary = '/movingSummary';
  static const String support = '/support';
  static const String moverProfile = '/moverProfile';
  static const String bigItem = '/bigItem';
  static const String pickUp = '/pickup';
  static const String helper = '/helper';
  static const String findingHelper = '/findingHelper';
  static const String availableHelper = '/availableHelper';
  static const String reviewHelpRequest = '/reviewHelpRequest';
  static const String depositRequired = '/depositRequired';
  static const String summaryHelper = '/summaryHelper';

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
    GetPage(name: moverDetails, page: () => MoverDetailsScreen()),
    GetPage(name: paymentMethod, page: () => PaymentMethodScreen()),
    GetPage(name: driverInfo, page: () => DriverInfoScreen()),
    GetPage(name: movingSummary, page: () => MovingSummaryScreen()),
    GetPage(
        name: support,
        page: () => SupportScreen(
              isBack: true,
            )),
    GetPage(name: moverProfile, page: () => ProfileScreen()),
    GetPage(name: bigItem, page: () => BigItemMainScreen()),
    GetPage(name: pickUp, page: () => PickupMainScreen()),
    GetPage(name: helper, page: () => HelperScreen()),
    GetPage(name: findingHelper, page: () => FindingHelperScreen()),
    GetPage(name: availableHelper, page: () => HelperListScreen()),
    GetPage(name: reviewHelpRequest, page: () => ReviewHelperRequestScreen()),
    GetPage(name: depositRequired, page: () => DepostiRequiredScreen()),
    GetPage(name: summaryHelper, page: () => HelperSummaryScreen())
  ];
}
