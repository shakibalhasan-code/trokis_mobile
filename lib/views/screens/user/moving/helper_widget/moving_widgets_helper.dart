import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trokis_mobile/core/utils/app_constant.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';

/// Helper widget for the address section.
Widget buildAddressSection({
  required String title,
  required String address,
  required String locationType,
  required String floorLevel,
  required String elevator,
  required String parking,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: AppStyles.titleMedium.copyWith(
          fontSize: 16.sp,
          color: Colors.black,
        ),
      ),
      SizedBox(height: 10.h),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Address row with icon
              Row(
                children: [
                  SvgPicture.asset(
                    AppConstant.upsIcon,
                    color: Colors.black,
                    width: 20.w,
                    height: 20.h,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      address,
                      style: AppStyles.titleMedium.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                'Location type : $locationType',
                style: AppStyles.titleMedium.copyWith(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Floor level : $floorLevel',
                style: AppStyles.titleMedium.copyWith(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Is there an elevator? : $elevator',
                style: AppStyles.titleMedium.copyWith(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Choose parking type : $parking',
                style: AppStyles.titleMedium.copyWith(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 10.h),
      Row(
        children: [
          const Spacer(),
          OutlinedButton(
            onPressed: () {},
            child: Text(
              'Edit',
              style: AppStyles.titleMedium.copyWith(
                color: Colors.black,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

/// Helper widget for the date and time section.
Widget buildDateTimeSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Date and time',
        style: AppStyles.titleMedium.copyWith(
          color: Colors.black,
          fontSize: 16.sp,
        ),
      ),
      SizedBox(height: 5.h),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          child: Row(
            children: [
              Text(
                'Date : 12-12-2024',
                style: AppStyles.titleMedium.copyWith(
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
              ),
              const Spacer(),
              Text(
                'Time : 12:00 PM',
                style: AppStyles.titleMedium.copyWith(
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

/// Helper widget for a photo section item.
Widget _buildPhotoSectionItem(String imagePath) {
  return Expanded(
    child: SizedBox(
      height: 145.h,
      width: 103,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

/// Helper widget for the items section.
Widget buildItemsSection() {
  // Returns a widget for a given item group section.
  Widget buildItemsGroupSection({
    required String iconPath,
    required String groupTitle,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              iconPath,
              color: Colors.black,
              width: 20.w,
              height: 20.h,
            ),
            SizedBox(width: 8.w),
            Text(
              groupTitle,
              style: AppStyles.titleMedium.copyWith(
                color: Colors.black,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        ...items.map((item) => Text(
              item,
              style: AppStyles.titleMedium.copyWith(fontSize: 12.sp),
            )),
        SizedBox(height: 10.h),
      ],
    );
  }

  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildItemsGroupSection(
            iconPath: AppConstant.bedroomsIcon,
            groupTitle: 'Bedrooms',
            items: [
              'King Bed (includes mattress) : 1',
              'Queen Bed (includes mattress) : 2',
              'Queen Bed (includes mattress) : 4',
            ],
          ),
          buildItemsGroupSection(
            iconPath: AppConstant.diningRoomIcon,
            groupTitle: 'Dining room',
            items: [
              'King Bed (includes mattress) : 1',
              'Queen Bed (includes mattress) : 2',
              'Queen Bed (includes mattress) : 4',
            ],
          ),
          buildItemsGroupSection(
            iconPath: AppConstant.officeStudioIcon,
            groupTitle: 'Office / studio',
            items: [
              'King Bed (includes mattress) : 1',
              'Queen Bed (includes mattress) : 2',
              'Queen Bed (includes mattress) : 4',
            ],
          ),
          buildItemsGroupSection(
            iconPath: AppConstant.electronicsIcon,
            groupTitle: 'Electronics',
            items: [
              'King Bed (includes mattress) : 1',
              'Queen Bed (includes mattress) : 2',
              'Queen Bed (includes mattress) : 4',
            ],
          ),
          buildItemsGroupSection(
            iconPath: AppConstant.lampsIcon,
            groupTitle: 'Lamps',
            items: [
              'King Bed (includes mattress) : 1',
              'Queen Bed (includes mattress) : 2',
              'Queen Bed (includes mattress) : 4',
            ],
          ),
          buildItemsGroupSection(
            iconPath: AppConstant.miscellaneousIcon,
            groupTitle: 'Miscellaneous',
            items: [
              'King Bed (includes mattress) : 1',
              'Queen Bed (includes mattress) : 2',
              'Queen Bed (includes mattress) : 4',
            ],
          ),
          buildItemsGroupSection(
            iconPath: AppConstant.terraceIcon,
            groupTitle: 'Terrace',
            items: [
              'King Bed (includes mattress) : 1',
              'Queen Bed (includes mattress) : 2',
              'Queen Bed (includes mattress) : 4',
            ],
          ),
          Text(
            'Photos/videos',
            style: AppStyles.titleMedium.copyWith(color: Colors.black),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              _buildPhotoSectionItem(AppConstant.beedRoomImage),
              SizedBox(width: 10.w),
              _buildPhotoSectionItem(AppConstant.beedRoomImage),
              SizedBox(width: 10.w),
              _buildPhotoSectionItem(AppConstant.beedRoomImage),
            ],
          ),
        ],
      ),
    ),
  );
}
