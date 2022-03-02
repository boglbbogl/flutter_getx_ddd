import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/scroll_test/scroll_test_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ScrollSecondPage extends StatelessWidget {
  const ScrollSecondPage({Key? key}) : super(key: key);

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
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.ease);
                },
              ),
            ),
            body: Platform.isIOS
                ? SmartRefresher(
                    primary: false,
                    enablePullDown: true,
                    enablePullUp: Platform.isIOS,
                    onRefresh: () {
                      print('sdfasdf');
                      x.refreshController.refreshCompleted();
                    },
                    onLoading: () {
                      x.addItem();
                      x.refreshController.loadComplete();
                    },
                    controller: x.refreshController,
                    scrollController: x.scrollController,
                    child: Container())
                : CustomScrollView(
                    controller: x.scrollController,
                    physics: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    slivers: [
                      if (!Platform.isIOS) ...[
                        CupertinoSliverRefreshControl(
                          refreshTriggerPullDistance: 100.0,
                          refreshIndicatorExtent: 30.0,
                          onRefresh: () async {
                            print('dasf');
                          },
                        ),
                      ],
                      SliverToBoxAdapter(
                        child: Container(
                          width: 100,
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: [
                              ...x.intList.map((e) => Text(e.toString()))
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          ...x.intList.map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Center(
                                child: Text(
                                  e.toString(),
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                          ),
                        ]),

                        // delegate: SliverChildBuilderDelegate(
                        //   (context, index) {
                        //     return Center(
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(20.0),
                        //         child: Text(
                        //           x.intList[index].toString(),
                        //           style: TextStyle(fontSize: 30),
                        //         ),
                        //       ),
                        //     );
                        //   },
                        //   childCount: x.intList.length,
                        // ),
                      ),
                    ],
                  ),
          );
        });
  }
}
