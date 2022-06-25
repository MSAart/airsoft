import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../mixin/constant/color_constant.dart';
import '../../../mixin/constant/textstyle_constant.dart';

class MycartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            )),
        backgroundColor: Colors.white,
        title: Text(
          'My Cart',
          style: Poppins15M.copyWith(color: primaryColor),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MycartView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
