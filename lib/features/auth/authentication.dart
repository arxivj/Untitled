abstract class Authentication<T> {
  Future<T> login();
  Future<void> logout();
}