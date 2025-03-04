import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trokis_mobile/controller/user_app_controller/helpers_controller.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/app_route.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_text_feild.dart';
import 'package:trokis_mobile/views/screens/global_widgets/white_card_widget.dart';

class HelperScreen extends StatelessWidget {
  HelperScreen({super.key});
  final helperController = Get.find<HelpersController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: WidgetsHelper.showAppBar(title: 'Helpers', isBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextFeild(
                  inputType: TextInputType.text,
                  controller: helperController.locationController,
                  hintText: 'Enter location',
                  suffixSVGIconPath: AppConstant.locationIcon,
                  colorIcon: Colors.grey),
              SizedBox(height: 5.h),
              MyTextFeild(
                  inputType: TextInputType.text,
                  controller: helperController.address2Controller,
                  hintText: 'Address line 2 (apt, office, floor, etc)',
                  suffixSVGIconPath: AppConstant.locationIcon,
                  colorIcon: Colors.grey),
              SizedBox(height: 5.h),

              /// Date & Time Pickers
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        final date = await helperController.selectDate();
                        if (date != null) {
                          helperController.selectedDate.value =
                              date.toString().split(' ')[0];
                        }
                      },
                      child: Obx(() => MyTextFeild(
                            isEditable: false,
                            inputType: TextInputType.datetime,
                            controller: helperController.dateController,
                            hintText: helperController.selectedDate.value,
                            suffixSVGIconPath: AppConstant.dateIcon,
                            colorIcon: Color(0xff545454),
                          )),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        await helperController.selectTime();
                      },
                      child: Obx(() => MyTextFeild(
                            isEditable: false,
                            inputType: TextInputType.datetime,
                            controller: helperController.timeController,
                            hintText: helperController.selectedTime.value,
                            suffixSVGIconPath: AppConstant.timeIcon,
                            colorIcon: Color(0xff545454),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),

              Text(
                'What do you need help for',
                style: AppStyles.titleMedium.copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 8.h),

              /// Dropdown Fields
              _buildDropdown(
                'Select Location Type',
                helperController.selectedHhelpFor,
                helperController.helpForList,
              ),
              SizedBox(height: 8.h),

              Text(
                'How many helpers do you need?*',
                style: AppStyles.titleMedium.copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 5.h),

              MyTextFeild(
                  inputType: TextInputType.number,
                  controller: helperController.helpersNeedController,
                  hintText: 'helpers*',
                  suffixSVGIconPath: null,
                  colorIcon: Colors.grey),
              SizedBox(height: 5.h),

              Text(
                'Estimate job duration*',
                style: AppStyles.titleMedium.copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 8.h),

              MyTextFeild(
                  inputType: TextInputType.number,
                  controller: helperController.helpersNeedController,
                  hintText: 'Job duration',
                  suffixSVGIconPath: null,
                  colorIcon: Colors.grey),
              SizedBox(height: 8.h),
              Text(
                'You offer per helper*',
                style: AppStyles.titleMedium.copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 8.h),

              MyTextFeild(
                  inputType: TextInputType.number,
                  controller: helperController.helpersNeedController,
                  hintText: 'offer',
                  suffixSVGIconPath: null,
                  colorIcon: Colors.grey),
              SizedBox(height: 8.h),
              Text(
                'Add details*',
                style: AppStyles.titleMedium.copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 8.h),

              MyTextFeild(
                  inputType: TextInputType.number,
                  controller: helperController.helpersNeedController,
                  hintText: 'Details',
                  maxLines: 3,
                  suffixSVGIconPath: null,
                  colorIcon: Colors.grey),

              SizedBox(height: 8.h),

              Text(
                'How will your pay you helper(s)?*',
                style: AppStyles.titleMedium.copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 8.h),

              /// Dropdown Fields
              _buildDropdown(
                'Select Location Type',
                helperController.selectedPaymentMethod,
                helperController.paymentMethodList,
              ),
              SizedBox(height: 20.h),
              Center(
                child: Text(
                  'See agreement with Helper',
                  style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
                ),
              ),
              SizedBox(height: 8.h),
              MyGlobButton(
                onTap: () => Get.toNamed(AppRoute.findingHelper),
                text: 'Request',
                isOutline: false,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  /// **Reusable Dropdown Widget**
  Widget _buildDropdown(
      String hint, RxString selectedValue, List<String> items) {
    return WhiteCardWidget(
      child: Obx(
        () => DropdownButton<String>(
          elevation: 1,
          hint: Text(hint),
          iconDisabledColor: Colors.black,
          icon: SvgPicture.asset(
            AppConstant.downArrowIcon,
            width: 20,
            height: 20,
            color: Colors.black,
          ),
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(12),
          value: selectedValue.value,
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: AppStyles.titleMedium.copyWith(fontSize: 16),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            if (newValue != null) {
              selectedValue.value = newValue;
            }
          },
          underline: SizedBox.shrink(),
          isExpanded: true,
        ),
      ),
    );
  }
}
