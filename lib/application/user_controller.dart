import 'package:flutter_getx/domain/i_user_repository.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UserGetX extends GetxController {
  final IUserRepostiory _iUserRepostiory;
  UserGetX(this._iUserRepostiory);
  void increment() {
    _iUserRepostiory.increment(add: 10);
  }
}
