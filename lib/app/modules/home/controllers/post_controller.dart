import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../mixin/constant/textstyle_constant.dart';
import '../../../models/product_model.dart';
import '../providers/product_provider.dart';

class PostController extends GetxController {
  final productProvider = Get.find<ProductProvider>();

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

  // void showDialog(String imageurl, String caption) {
  //   Get.defaultDialog(
  //       title: "Upload Success",
  //       actions: [
  //         ElevatedButton(
  //             style: ButtonStyle(
  //                 shape: MaterialStateProperty.all(const RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.all(Radius.circular(10))))),
  //             onPressed: () {
  //               Get.back();
  //             },
  //             child: const Text(
  //               "Close",
  //               style: TextStyle(color: Colors.white),
  //             ))
  //       ],
  //       content: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           ClipRRect(
  //             borderRadius: const BorderRadius.all(Radius.circular(10)),
  //             child: Image.network(
  //               'https://openapi.mrstein.web.id/uploads/' + imageurl,
  //               width: 100,
  //               height: 100,
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 20,
  //           ),
  //           Text(
  //             caption,
  //           )
  //         ],
  //       ));
  // }

  void submitToServer() async {
    if (fileImagePicker.value.existsSync()) {
      isLoading.value = true;
      productProvider
          .postProduct(
        nameController.text,
        descController.text,
        int.parse(priceController.text),
        fileImagePicker.value,
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
                  'Has been added to Store ',
                  style: Poppins12L.copyWith(color: Color(0xff287d3c)),
                ),
              ],
            ),
            backgroundColor: Color(0xffedf9f0));
      }).onError((error, stackTrace) {
        isLoading.value = false;
        print("Error $stackTrace  $error");
        Get.snackbar("Pesan", "Terjadi kesalahan pada Server !");
      });
    } else {
      Get.snackbar("Pesan", "Gambar masih kosong !");
    }
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
