abstract class TokenRepositoryInterface {
  Future<String?> getToken();
  Future<void> setToken(String token);
  Future<void> removeToken();
}
