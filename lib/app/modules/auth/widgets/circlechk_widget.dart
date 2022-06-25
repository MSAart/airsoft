import 'package:airsoft/app/mixin/constant/textstyle_constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleCheck extends StatelessWidget {
  const CircleCheck(
      {Key? key, required this.condition, required this.textcheck})
      : super(key: key);

  final bool condition;
  final String textcheck;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          condition
              ? SvgPicture.asset(
                  'assets/images/crcactive_svg.svg',
                  height: 20,
                  width: 20,
                )
              : SvgPicture.asset(
                  'assets/images/crcnactive_svg.svg',
                  height: 20,
                  width: 20,
                ),
          const SizedBox(
            width: 10,
          ),
          Text(
            textcheck,
            style: Poppins12R,
          )
        ],
      ),
    );
  }
}
