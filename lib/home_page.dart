import 'package:flutter/material.dart';
import 'package:flutter_getx/scroll_test/scroll_first_page.dart';
import 'package:flutter_getx/scroll_test/scroll_second_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Get.to(ScrollFirstPage());
                },
                child: Text('First')),
            TextButton(
                onPressed: () {
                  Get.to(ScrollSecondPage());
                },
                child: Text('Second')),
          ],
        ),
      ),
    );
  }
}
