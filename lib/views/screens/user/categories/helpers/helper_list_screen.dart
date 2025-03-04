import 'package:flutter/material.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/global_widgets/my_glob_button.dart';
import 'package:trokis_mobile/views/screens/user/categories/helpers/components/helper_list_item.dart';
import 'package:trokis_mobile/views/screens/user/categories/moving/items/movers_item.dart';

class HelperListScreen extends StatelessWidget {
  const HelperListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: WidgetsHelper.showAppBar(title: 'Helper List', isBack: true),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return HelperListItem(onTap: () {});
                    })),
            MyGlobButton(
              text: 'Next',
              isOutline: false,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
