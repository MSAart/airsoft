import 'package:airsoft/app/modules/transaction/controllers/detailtransaction_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../mixin/constant/color_constant.dart';
import '../../../mixin/constant/textstyle_constant.dart';

class DetailtransactionView extends StatelessWidget {
  final controller = Get.find<DetailtransactionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: Container(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 40),
              primary: secondColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            onPressed: () {},
            child: Text('Checkout Now'),
          ),
        ),
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
            'Checkout Details',
            style: Poppins15M.copyWith(color: primaryColor),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'List Items',
                style: Poppins12B,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      CheckoutTile(controller: controller),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Summary',
                        style: Poppins12M,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Quantity',
                            style: Poppins12L,
                          ),
                          Text(
                            '${controller.detail!.value.qty} items',
                            style: Poppins12L,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Price',
                            style: Poppins12L,
                          ),
                          Text(
                            'Rp.${controller.detail!.value.price}',
                            style: Poppins12L,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shiping',
                            style: Poppins12L,
                          ),
                          Text(
                            'Free',
                            style: Poppins12L,
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: Poppins12M.copyWith(color: ancentColor),
                          ),
                          Text(
                            'Rp.${controller.detail!.value.price}',
                            style: Poppins12M.copyWith(color: ancentColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class CheckoutTile extends StatelessWidget {
  const CheckoutTile({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DetailtransactionController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: CachedNetworkImage(
            height: 50,
            width: 50,
            imageUrl:
                'https://openapi.mrstein.web.id/uploads/${controller.detail!.value.photo}',
            imageBuilder: (context, imageProvider) => Image(
              image: imageProvider,
            ),
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${controller.detail!.value.name}',
              style: Poppins12B,
            ),
            Text(
              'Rp.${controller.detail!.value.price}',
              style: Poppins12R.copyWith(color: ancentColor),
            ),
          ],
        ),
        Spacer(),
        Text(
          '${controller.detail!.value.qty} Items',
          style: Poppins12R.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
