import 'package:airsoft/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../mixin/constant/color_constant.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            Get.toNamed(Routes.ADDPRODUCT);
          },
          icon: Icon(
            Icons.add_business,
            color: primaryColor,
          ),
        ),
        IconButton(
          onPressed: () {
            Get.toNamed(Routes.TRANSACTION);
          },
          icon: Icon(
            Icons.receipt_long_rounded,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
