import 'package:airsoft/app/modules/home/controllers/detail_controller.dart';
import 'package:airsoft/app/modules/home/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class GridViewCustom extends StatelessWidget {
  final _controller = Get.find<HomeController>();
  final _controllerDetail = Get.find<DetailController>();

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        staggeredTileBuilder: (index) =>
            StaggeredTile.count(2, index.isEven ? 3 : 2.5),
        crossAxisCount: 4,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        itemCount: _controller.getItemLength(),
        itemBuilder: (context, index) {
          if (index < _controller.listProduct.length) {
            return ProductView(
              results: _controller.listProduct[index],
              onTap: () {
                print(_controller.listProduct[index].id);
                _controllerDetail
                    .detailProduct(_controller.listProduct[index].id);
              },
            );
          } else {
            return Container(
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}
