import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../mixin/constant/textstyle_constant.dart';
import '../../../models/product_model.dart';
import '../providers/product_provider.dart';

class EditController extends GetxController {
  final productProvider = Get.find<ProductProvider>();
  RxInt id = 0.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  var isLoading = false.obs;
  Rx<File> fileImagePicker = Rx(File(""));

  final ImagePicker _picker = ImagePicker();

  void choosePhotoFrom() {
    Get.defaultDialog(
        title: "Upload Success",
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              onTap: () {
                showImagePicker("gallery");
                Get.back();
              },
              title: Text("Gallery"),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                showImagePicker("camera");
                Get.back();
              },
              title: Text("Camera"),
            )
          ],
        ));
  }

  void UpdatetoServer(int? id) async {
    isLoading.value = true;
    productProvider
        .updateProduct(
      id!,
      nameController.text,
      descController.text,
      int.parse(priceController.text),
    )
        .then((Product value) {
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
                'Has been update product ',
                style: Poppins12L.copyWith(color: Color(0xff287d3c)),
              ),
            ],
          ),
          backgroundColor: Color(0xffedf9f0));
    }).onError((error, stackTrace) {
      isLoading.value = false;
      print("Error $stackTrace  $error");
      Get.snackbar("Pesan", "Jancuk!");
    });
  }

  void showImagePicker(String from) async {
    if (from == "gallery") {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      fileImagePicker.value = File(image!.path);
    } else {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      fileImagePicker.value = File(image!.path);
    }
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    descController = TextEditingController();
    priceController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    priceController.dispose();
    super.dispose();
  }
}
