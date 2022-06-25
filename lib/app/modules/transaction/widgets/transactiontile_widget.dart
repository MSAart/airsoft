import 'package:airsoft/app/mixin/constant/color_constant.dart';
import 'package:airsoft/app/mixin/constant/textstyle_constant.dart';
import 'package:airsoft/app/models/res/transactionget_model.dart';

import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({required this.detail, required this.onTap, Key? key})
      : super(key: key);

  final ResultsGet detail;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 3,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.shopping_bag_rounded,
                          color: primaryColor,
                        ),
                        Text(
                          "Date : ${detail.date}",
                          style: Poppins12L,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "ID Transaction",
                      style: Poppins12L,
                    ),
                    Text(
                      '${detail.transCode}',
                      style: Poppins12B,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
