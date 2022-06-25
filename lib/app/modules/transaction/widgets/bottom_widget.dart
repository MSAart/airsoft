import 'package:flutter/material.dart';

import '../../../mixin/constant/color_constant.dart';
import '../../../mixin/constant/textstyle_constant.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Rp. Total Harga',
            style: Poppins15M.copyWith(color: primaryColor),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: ancentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            onPressed: () {},
            child: Text('Checkout'),
          )
        ],
      ),
    );
  }
}
