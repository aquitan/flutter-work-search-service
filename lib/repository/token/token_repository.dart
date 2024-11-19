import 'package:ia_ma/repository/token/token_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenRepository implements TokenRepositoryInterface {
  TokenRepository({required this.prefferences});

  final SharedPreferences prefferences;

  @override
  Future<String?> getToken() async {
    final token = prefferences.getString('token');

    return token;
  }

  @override
  Future<void> setToken(String token) async {
    await prefferences.setString('token', token);
  }

  @override
  Future<void> removeToken() async {
    await prefferences.remove('token');
  }
}
