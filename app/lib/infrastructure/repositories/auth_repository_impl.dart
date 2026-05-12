import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<UserEntity> login(String email, String password) async {
    // Aquí, en el futuro real, enviarías el email y password al DataSource.
    // Por ahora, solo obtenemos el usuario de prueba de la API pública.
    try {
      final userModel = await dataSource.fetchDummyUser();
      return userModel; // Retorna la entidad gracias al polimorfismo
    } catch (e) {
      throw Exception('Fallo en la autenticación: $e');
    }
  }
}