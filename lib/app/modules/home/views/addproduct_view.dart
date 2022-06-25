import 'package:airsoft/app/mixin/constant/textstyle_constant.dart';
import 'package:airsoft/app/modules/home/controllers/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../mixin/constant/color_constant.dart';
import '../widgets/textfield_widget.dart';

class AddProductView extends StatelessWidget {
  final _controller = Get.find<PostController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Add Product',
          style: Poppins15M.copyWith(color: primaryColor),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Name Product',
                style: Poppins12R.copyWith(color: primaryColor),
              ),
              TextFieldInput(
                  textController: _controller.nameController, hinText: 'Name'),
              Text(
                'Description Product',
                style: Poppins12R.copyWith(color: primaryColor),
              ),
              TextFieldInput(
                  textController: _controller.descController,
                  hinText: 'Description'),
              Text(
                'Price Product',
                style: Poppins12R.copyWith(color: primaryColor),
              ),
              TextFieldInput(
                  textController: _controller.priceController,
                  hinText: 'Price'),
              Text(
                'Photo',
                style: Poppins12R.copyWith(color: primaryColor),
              ),
              Obx(() {
                if (_controller.fileImagePicker.value.existsSync()) {
                  return InkWell(
                    onTap: () {
                      _controller.choosePhotoFrom();
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.file(
                        _controller.fileImagePicker.value,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      _controller.choosePhotoFrom();
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        "assets/images/no_image.png",
                        height: 100,
                        width: 100,
                      ),
                    ),
                  );
                }
              }),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                    primary: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onPressed: () {
                    _controller.submitToServer();
                    Get.back();
                  },
                  child: Obx(() {
                    if (_controller.isLoading.value == true) {
                      return const Text(
                        "Uploading...",
                        style: Poppins12M,
                      );
                    } else {
                      return const Text(
                        "Upload To Server",
                        style: Poppins12M,
                      );
                    }
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
