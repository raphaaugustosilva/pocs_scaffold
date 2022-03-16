import 'dart:developer';
import 'package:pocs_scaffold/domain/entities/user/user_entity.dart';
import 'package:pocs_scaffold/domain/usecases/user/i_load_user.dart';
import 'package:pocs_scaffold/presentation/presenters/presenter_base.dart';
import 'package:pocs_scaffold/services/usecases/user/load_user.dart';

class HomePresenter extends PresenterBase {
  late final ILoadUser _loadUser;
  UserEntity? _userEntity;
  UserEntity? get userEntity => _userEntity;

  void init() {
    _loadUser = LoadUser();
  }

  Future<void> loadUser(String userId) async {
    setIsLoading(false);

    try {
      _userEntity = await _loadUser.executeAsync(userId);
      await Future.delayed(const Duration(seconds: 4)); // Simula o tempo de carregamento da chamada acima
    } catch (e) {
      log("Erro ao carregar usuário: $e");
    } finally {
      setIsLoading(true);
    }
  }
}
