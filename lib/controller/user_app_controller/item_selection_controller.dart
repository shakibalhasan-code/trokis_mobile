import 'package:get/get.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';

class ItemSelectionController extends GetxController {
  List<Map<String, String>> itemsWithIcons = [
    {"icon": AppConstant.appliancesIcon, "title": "Appliances"},
    {"icon": AppConstant.bedroomsIcon, "title": "Bedrooms"},
    {"icon": AppConstant.boxsIcon, "title": "Boxes And Suitcases"},
    {"icon": AppConstant.corporateOfficeIcon, "title": "Corporate Offices"},
    {"icon": AppConstant.diningRoomIcon, "title": "Dining Room"},
    {"icon": AppConstant.electronicsIcon, "title": "Electronics"},
    {"icon": AppConstant.industrialIcon, "title": "Industrial"},
    {"icon": AppConstant.lampsIcon, "title": "Lamps"},
    {"icon": AppConstant.livingRoomIcon, "title": "Living Room"},
    {"icon": AppConstant.miscellaneousIcon, "title": "Miscellaneous"},
    {"icon": AppConstant.officeStudioIcon, "title": "Office / Studio"},
    {"icon": AppConstant.terraceIcon, "title": "Terrace"},
  ];
}
