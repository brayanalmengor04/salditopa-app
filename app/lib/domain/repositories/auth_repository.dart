import '../entities/user_entity.dart';

abstract class AuthRepository {
  /// Simula el login y retorna los datos del usuario
  Future<UserEntity> login(String email, String password);
}