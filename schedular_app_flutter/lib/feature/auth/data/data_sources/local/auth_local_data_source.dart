import 'package:hive/hive.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box box;

  const AuthLocalDataSourceImpl({required this.box});

  @override
  Future<void> cacheToken(String token) async {
    await box.put('token', token);
  }

  @override
  Future<void> clearToken() async {
    await box.delete('token');
  }

  @override
  Future<String?> getToken() async {
    return await box.get('token') as String?;
  }
}
