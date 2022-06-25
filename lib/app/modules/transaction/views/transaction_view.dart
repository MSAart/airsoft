import 'package:airsoft/app/mixin/constant/color_constant.dart';
import 'package:airsoft/app/mixin/constant/textstyle_constant.dart';

import 'package:airsoft/app/modules/transaction/controllers/detailtransaction_controller.dart';
import 'package:airsoft/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:airsoft/app/modules/transaction/widgets/transactiontile_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionView extends StatelessWidget {
  final _controller = Get.find<TransactionController>();
  final _controllerTrDetail = Get.find<DetailtransactionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )),
        child: Obx(
          () => Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: _controller.listTransaction.isEmpty
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
                                    _controller.fetchTransaction();
                                  }
                                }
                              }
                              return true;
                            },
                            child: RefreshIndicator(
                              onRefresh: () async {
                                _controller.fetchTransaction(refresh: true);
                              },
                              child: ListView.builder(
                                  itemCount: _controller.getItemLength(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (index <
                                        _controller.listTransaction.length) {
                                      return TransactionTile(
                                        detail:
                                            _controller.listTransaction[index],
                                        onTap: () {
                                          _controllerTrDetail.detailTransaction(
                                              _controller
                                                  .listTransaction[index].id);
                                        },
                                      );
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  }),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
