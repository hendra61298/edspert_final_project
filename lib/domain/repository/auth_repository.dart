import '../../data/models/request/user/register_user_request.dart';
import '../../data/models/response/user/user_response.dart';

abstract class AuthRepository {
  Future<UserData?> getUserByEmail({required String email});

  Future<bool> registerUser({required UserBody userBody});
}