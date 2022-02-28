import 'package:flutter_getx/domain/i_user_repository.dart';
import 'package:flutter_getx/domain/user_model.dart';

class UserRepository implements IUserRepostiory {
  @override
  Add increment({required int add}) {
    final _result = Add(count: add);
    return _result;
  }
}
