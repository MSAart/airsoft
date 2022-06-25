import 'package:airsoft/app/mixin/constant/textstyle_constant.dart';
import 'package:airsoft/app/modules/home/controllers/detail_controller.dart';
import 'package:airsoft/app/modules/home/controllers/edit_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../mixin/constant/color_constant.dart';
import '../widgets/textfield_widget.dart';

class EditProductView extends StatelessWidget {
  final _controller = Get.find<EditController>();
  final _controllerDetail = Get.find<DetailController>();

  @override
  Widget build(BuildContext context) {
    _controller.nameController.text =
        _controllerDetail.detail!.value.data!.name.toString();
    _controller.descController.text =
        _controllerDetail.detail!.value.data!.description.toString();
    _controller.priceController.text =
        _controllerDetail.detail!.value.data!.price.toString();

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
          'Update Product',
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
                        (_controller.fileImagePicker.value),
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
                      child: CachedNetworkImage(
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                        imageUrl:
                            'https://openapi.mrstein.web.id/uploads/${_controllerDetail.detail!.value.data!.photo}',
                        imageBuilder: (context, imageProvider) => Image(
                          image: imageProvider,
                        ),
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
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
                    _controller.UpdatetoServer(
                        _controllerDetail.detail!.value.data!.id);
                    //Get.back();
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
