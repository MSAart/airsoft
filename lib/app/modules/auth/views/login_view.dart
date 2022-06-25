import 'package:airsoft/app/mixin/constant/color_constant.dart';
import 'package:airsoft/app/mixin/constant/textstyle_constant.dart';
import 'package:airsoft/app/modules/auth/controllers/login_controller.dart';
import 'package:airsoft/app/modules/auth/widgets/emailfield_widget.dart';
import 'package:airsoft/app/modules/auth/widgets/passfield_widget.dart';
import 'package:airsoft/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Form(
        key: controller.formKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {},
                    child: SvgPicture.asset('assets/images/logo_svg.svg')),
              ),
              SizedBox(height: 40),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Sign ',
                        style: Poppins25B.copyWith(color: primaryColor)),
                    TextSpan(
                        text: 'In',
                        style: Poppins25B.copyWith(color: secondColor)),
                  ],
                ),
              ),
              Text(
                'Welcome to airsoft, please put your login below to start using the app',
                style: Poppins12L,
              ),
              SizedBox(height: 20),
              EmailFieldCustom(
                emaiLController: controller.emailController,
                hinText: 'Email',
              ),
              SizedBox(
                height: 20,
              ),
              PassFieldCustom(
                  passController: controller.passController,
                  hinText: 'Password'),
              Row(
                children: [
                  SvgPicture.asset('assets/images/chknactive_svg.svg'),
                  SizedBox(width: 10),
                  Text(
                    'Remember Me ?',
                    style: Poppins12L,
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: Poppins12M.copyWith(color: secondColor),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: secondColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onPressed: () {
                    controller.login();
                  },
                  child: Text(
                    'Sign In',
                    style: Poppins12M,
                  )),
              SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have account ? ",
                    style: Poppins12R,
                  ),
                  InkWell(
                    child: Text(
                      'Sign Up',
                      style: Poppins12M.copyWith(color: secondColor),
                    ),
                    onTap: () => Get.toNamed(Routes.REGISTER),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
