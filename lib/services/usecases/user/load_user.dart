import 'package:pocs_scaffold/domain/entities/user/user_entity.dart';
import 'package:pocs_scaffold/domain/usecases/user/i_load_user.dart';

class LoadUser implements ILoadUser {
  LoadUser();

  @override
  Future<UserEntity?> executeAsync(String userId) async {
    UserEntity? result = UserEntity(id: userId, name: 'Nome usuário $userId');
    return result;
  }
}
