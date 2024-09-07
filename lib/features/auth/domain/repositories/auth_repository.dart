abstract class AuthRepository<T> {
  Future<T> login(String platform);
}