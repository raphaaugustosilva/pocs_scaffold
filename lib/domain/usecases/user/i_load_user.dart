import 'package:pocs_scaffold/domain/entities/user/user_entity.dart';

abstract class ILoadUser {
  Future<UserEntity?> executeAsync(String userId);
}
