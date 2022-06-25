import 'package:airsoft/app/modules/home/widgets/actionbar_widget.dart';
import 'package:airsoft/app/modules/home/widgets/gridview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/images/logo_svg.svg'),
        backgroundColor: Colors.white,
        elevation: 0.2,
        actions: [ActionBar()],
      ),
      body: Obx(
        () => Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: _controller.listProduct.isEmpty
                      ? Container(
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : NotificationListener<ScrollNotification>(
                          onNotification:
                              (ScrollNotification scrollNotification) {
                            if (scrollNotification.metrics.pixels ==
                                scrollNotification.metrics.maxScrollExtent) {
                              if (_controller.isNoLoadMore == false) {
                                if (_controller.isLoading == false) {
                                  _controller.fetchProduct();
                                }
                              }
                            }
                            return true;
                          },
                          child: RefreshIndicator(
                              onRefresh: () async {
                                _controller.fetchProduct(refresh: true);
                              },
                              child: GridViewCustom()),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
