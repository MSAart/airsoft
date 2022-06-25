import 'package:airsoft/app/mixin/constant/color_constant.dart';
import 'package:airsoft/app/mixin/constant/textstyle_constant.dart';
import 'package:airsoft/app/models/product_model.dart';
import 'package:airsoft/app/modules/home/controllers/home_controller.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  ProductView({required this.results, Key? key, required this.onTap})
      : super(key: key);
  final controller = Get.find<HomeController>();
  final Results results;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 2,
            child: Container(
              //width: 100,
              padding: const EdgeInsets.all(5),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://openapi.mrstein.web.id/uploads/${results.photo}',
                        imageBuilder: (context, imageProvider) => Image(
                          image: imageProvider,
                        ),
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${results.name}',
                            style: Poppins12L.copyWith(color: primaryColor),
                          ),
                          Text(
                            'Rp ${results.price}',
                            style: Poppins12M.copyWith(color: secondColor),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 40),
                                primary: ancentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              onPressed: () {
                                controller.removeProduct(results.id!);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete_forever,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Remove',
                                    style: Poppins12L.copyWith(
                                        color: Colors.white),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(20),
        onTap: onTap);
  }
}
