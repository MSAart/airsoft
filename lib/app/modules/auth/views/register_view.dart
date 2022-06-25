import 'package:airsoft/app/modules/auth/controllers/register_controller.dart';

import 'package:airsoft/app/modules/auth/widgets/emailregis_widget.dart';
import 'package:airsoft/app/modules/auth/widgets/passregis_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../mixin/constant/color_constant.dart';
import '../../../mixin/constant/textstyle_constant.dart';
import '../widgets/textfield_widget.dart';

class RegisterView extends StatelessWidget {
  final controller = Get.find<RegisterController>();
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
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Sign ',
                      style: Poppins25B.copyWith(color: primaryColor),
                    ),
                    TextSpan(
                      text: 'Up',
                      style: Poppins25B.copyWith(color: secondColor),
                    ),
                  ],
                ),
              ),
              Text(
                'Create your account to use this app to shop airsoft',
                style: Poppins12L,
              ),
              SizedBox(height: 20),
              TextFieldCustom(
                textController: controller.nameController,
                hinText: 'Full Name',
              ),
              SizedBox(
                height: 15,
              ),
              EmailRegisCustom(
                emaiLController: controller.emailController,
                hinText: 'Email',
              ),
              SizedBox(
                height: 15,
              ),
              PassRegisCustom(
                passController: controller.passController,
                hinText: 'Password',
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'By signning up you are agreeing to our ',
                        style: Poppins12R),
                    TextSpan(
                        text: 'Terms and Conditions',
                        style: Poppins12M.copyWith(color: secondColor))
                  ],
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: secondColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onPressed: () {
                    controller.register();
                  },
                  child: Text(
                    'Sign Up',
                    style: Poppins12M,
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have account ? ",
                    style: Poppins12R,
                  ),
                  InkWell(
                    child: Text(
                      'Sign In',
                      style: Poppins12M.copyWith(color: secondColor),
                    ),
                    onTap: () => Get.back(),
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
