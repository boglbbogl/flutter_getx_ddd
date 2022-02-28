import 'package:flutter/material.dart';
import 'package:flutter_getx/application/user_controller.dart';
import 'package:flutter_getx/main.dart';
import 'package:get/instance_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userGetX = Get.put(getIt<UserGetX>());
    return Container();
  }
}
