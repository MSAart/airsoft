import 'package:airsoft/app/mixin/constant/textstyle_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../servers/erorhandling_server.dart';

showSnackBar(message,
    {String textButton = "", required Function() onButtonClick}) {
  String msg;

  if (message is ErrorHandling) {
    msg = message.message;
  } else {
    msg = message.toString();
  }

  if (msg == 'Password Incorrect') {
    Get.snackbar("", "",
        titleText: Text(
          'Warning',
          style: Poppins12M.copyWith(
            color: Color(0xffB95000),
          ),
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        snackPosition: SnackPosition.BOTTOM,
        messageText: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.warning,
              color: Color(0xffB95000),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              msg,
              style: Poppins12L.copyWith(color: Color(0xffB95000)),
            ),
          ],
        ),
        backgroundColor: Color(0xfffff4ec));
  } else if (msg == 'Response Success !') {
    Get.snackbar("", "",
        titleText: Text(
          'Success ',
          style: Poppins12M.copyWith(
            color: Color(0xff287d3c),
          ),
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        snackPosition: SnackPosition.BOTTOM,
        messageText: Row(
          // mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.check_circle,
              color: Color(0xff287d3c),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login Success ',
              style: Poppins12L.copyWith(color: Color(0xff287d3c)),
            ),
          ],
        ),
        backgroundColor: Color(0xffedf9f0));
  } else {
    Get.snackbar("", "",
        titleText: Text(
          'Success',
          style: Poppins12M.copyWith(
            color: Color(0xffda1414),
          ),
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        snackPosition: SnackPosition.BOTTOM,
        messageText: Row(
          // mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.error,
              color: Color(0xffda1414),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login Success',
              style: Poppins12L.copyWith(color: Color(0xffda1414)),
            ),
          ],
        ),
        backgroundColor: Color(0xfffeefef));
  }
}
