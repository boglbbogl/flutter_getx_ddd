import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class Controller extends GetxController {
  RxInt firstCount = 0.obs;

  void firstIncrement() => firstCount++;
  void firstDecrement() => firstCount--;
}
