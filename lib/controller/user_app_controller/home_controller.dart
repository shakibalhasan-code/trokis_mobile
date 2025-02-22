import 'package:get/get.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';

class HomeController extends GetxController{


  List<Map<String, dynamic>> homeCategory = [
    {
      'title' : 'Moving',
      'image' : AppConstant.movingImage,
    },
    {
      'title' : 'Big Item',
      'image' : AppConstant.bigItemImage,
    },
    {
      'title' : 'Helpers',
      'image' : AppConstant.helpersImage,
    },
    {
      'title' : 'Errands',
      'image' : AppConstant.errandsImage,
    },
    {
      'title' : 'Line waiting',
      'image' : AppConstant.lineWaitingImage,
    },
  ];

}