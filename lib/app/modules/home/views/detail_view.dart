import 'package:airsoft/app/mixin/constant/color_constant.dart';
import 'package:airsoft/app/mixin/constant/textstyle_constant.dart';
import 'package:airsoft/app/modules/home/controllers/detail_controller.dart';
import 'package:airsoft/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:airsoft/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  final _controller = Get.find<DetailController>();
  final _controllerTransaction = Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 40),
                primary: secondColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              onPressed: () {
                _controllerTransaction.addToCart([
                  {
                    "id": _controller.detail!.value.data!.id,
                    "name": _controller.detail!.value.data!.name,
                    "price": _controller.detail!.value.data!.price,
                    "qty": _controller.count.value,
                    "image": _controller.detail!.value.data!.photo
                  }
                ]);
              },
              child: Text(
                'Add To Cart',
                style: Poppins12M,
              )),
        ),
        backgroundColor: Colors.grey[200],
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
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.EDITPRODUCT);
                },
                icon: Icon(
                  Icons.edit,
                  color: primaryColor,
                ))
          ],
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(30),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl:
                    'https://openapi.mrstein.web.id/uploads/${_controller.detail!.value.data!.photo}',
                imageBuilder: (context, imageProvider) => Image(
                  image: imageProvider,
                ),
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_controller.detail!.value.data!.name}',
                      style: Poppins20M.copyWith(color: Colors.black),
                    ),
                    Divider(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Description',
                      style: Poppins12B,
                    ),
                    Text(
                      "${_controller.detail!.value.data!.description}",
                      style: Poppins12L,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Quantity',
                              style: Poppins12M,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(10, 20),
                                      primary: ancentColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                    ),
                                    onPressed: () => _controller.decrement(),
                                    child: Text(
                                      '-',
                                      style: Poppins12B,
                                    )),
                                Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Obx(() => Center(
                                        child: Text(
                                            '${_controller.count.value}')))),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(10, 20),
                                      primary: ancentColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                    ),
                                    onPressed: () => _controller.increment(),
                                    child: Text('+', style: Poppins12B)),
                              ],
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price',
                              style: Poppins12M,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${_controller.detail!.value.data!.price}',
                              style: Poppins15M,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
