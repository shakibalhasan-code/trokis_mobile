// /// **Reusable Dropdown Widget**
// Widget _buildDropdown(String hint, RxString selectedValue, List<String> items) {
//   return WhiteCardWidget(
//     child: Obx(() => DropdownButton<String>(
//           elevation: 1,
//           hint: Text(hint),
//           iconDisabledColor: Colors.black,
//           icon: SvgPicture.asset(
//             AppConstant.downArrowIcon,
//             width: 20.w,
//             height: 20.h,
//             color: Colors.black,
//           ),
//           dropdownColor: Colors.white,
//           borderRadius: BorderRadius.circular(12.r),
//           value: selectedValue.value,
//           items: items.map((item) {
//             return DropdownMenuItem<String>(
//               value: item,
//               child: Text(
//                 item,
//                 style: AppStyles.titleMedium.copyWith(fontSize: 16.sp),
//               ),
//             );
//           }).toList(),
//           onChanged: (newValue) {
//             if (newValue != null) {
//               selectedValue.value = newValue;
//             }
//           },
//           underline: SizedBox.shrink(),
//           isExpanded: true,
//         )),
//   );
// }

// void incrementFloorLevel() {
//   if (_userLocationController.selectedFloorLevel.value < 20) {
//     _userLocationController.selectedFloorLevel.value++;
//   }
// }

// void decrementFloorLevel() {
//   if (_userLocationController.selectedFloorLevel.value > 0) {
//     _userLocationController.selectedFloorLevel.value--;
//   }
// }

// Color get floorColor {
//   if (_userLocationController.selectedFloorLevel.value < 5) {
//     return Colors.green;
//   } else if (_userLocationController.selectedFloorLevel.value < 10) {
//     return Colors.purple;
//   } else if (_userLocationController.selectedFloorLevel.value < 15) {
//     return Colors.orange;
//   } else {
//     return Colors.red;
//   }
// }
