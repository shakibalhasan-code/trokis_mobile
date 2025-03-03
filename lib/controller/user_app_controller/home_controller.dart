import 'package:get/get.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';

class HomeController extends GetxController {
  List<Map<String, dynamic>> homeCategory = [
    {
      'title': 'Moving',
      'image': AppConstant.movingImage,
      'route': AppRoute.startingLocation
    },
    {
      'title': 'Big Item',
      'image': AppConstant.bigItemImage,
      'route': AppRoute.bigItem
    },
    {
      'title': 'Helpers',
      'image': AppConstant.helpersImage,
      'route': AppRoute.startingLocation
    },
    {
      'title': 'Errands',
      'image': AppConstant.errandsImage,
      'route': AppRoute.startingLocation
    },
    {
      'title': 'Line waiting',
      'image': AppConstant.lineWaitingImage,
      'route': AppRoute.startingLocation
    },
  ];
}
