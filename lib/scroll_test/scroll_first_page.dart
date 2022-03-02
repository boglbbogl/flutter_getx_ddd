import 'package:flutter/material.dart';
import 'package:flutter_getx/scroll_test/scroll_test_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ScrollFirstPage extends StatelessWidget {
  ScrollFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScrollTestController>(
        init: ScrollTestController(),
        builder: (x) {
          return Scaffold(
            appBar: AppBar(),
            floatingActionButton: Visibility(
              visible: x.isVisibie,
              child: FloatingActionButton(
                onPressed: () {
                  x.scrollController.animateTo(0,
                      duration: const Duration(milliseconds: 5000),
                      curve: Curves.ease);
                },
              ),
            ),
            body: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              primary: false,
              onRefresh: () {
                x.refreshController.refreshCompleted();
                print('12312');
              },
              onLoading: () {
                x.addItem();
                x.refreshController.loadComplete();
              },
              controller: x.refreshController,
              scrollController: x.scrollController,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            ...x.intList.map((e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(child: Text(e.toString())),
                                ))
                          ],
                        )),
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        ...x.intList.map((e) => Center(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                e.toString(),
                                style: TextStyle(fontSize: 30),
                              ),
                            ))),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
