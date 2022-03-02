import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ScrollTestController extends GetxController {
  List<int> intList = [];
  bool isVisibie = false;
  ScrollController scrollController = ScrollController();
  RefreshController refreshController = RefreshController();

  ScrollTestController() {
    List.generate(10, (index) {
      intList.add(index);
    });
  }

  void addItem() {
    intList.add(1);
    update();
  }

  @override
  void onInit() {
    scrollController.addListener(() {
      if (scrollController.offset > 80) {
        isVisibie = true;
        update();
      } else {
        isVisibie = false;
        update();
      }
      print(scrollController.offset);
    });
    super.onInit();
  }
}
