import 'package:flutter/material.dart';
import 'package:flutter_getx/controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cPut = Get.put(Controller());
    final Controller _cFind = Get.find();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(() => Text(
                  _cFind.firstCount.toString(),
                  style: const TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      _cFind.firstIncrement();
                    },
                    icon: const Icon(
                      Icons.add_circle_outline_sharp,
                      size: 30,
                      color: Colors.amber,
                    )),
                IconButton(
                    onPressed: () {
                      _cFind.firstDecrement();
                    },
                    icon: const Icon(
                      Icons.remove_circle_outline_sharp,
                      size: 30,
                      color: Colors.amber,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
