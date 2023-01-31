
import 'package:flutter/foundation.dart';
import 'package:submission_finpro/data/models/request/user/register_user_request.dart';
import 'package:submission_finpro/data/models/response/user/user_response.dart';
import 'package:submission_finpro/domain/repository/auth_repository.dart';

import '../../common/const/urls.dart';
import '../services/dio_client.dart';

class AuthRepositoryImpl implements AuthRepository{
  final DioClient dioClient;

  AuthRepositoryImpl(this.dioClient);

  @override
  Future<UserData?> getUserByEmail({required String email}) async {
    try {
      final result = await dioClient.get(
        Urls.users,
        queryParameters: {"email": email},
      );
      UserResponse res = UserResponse.fromJson(result);

      return res.data;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getUserByEmail: $e, $stackTrace');
      }
      return null;
    }
  }

  @override
  Future<bool> registerUser({required UserBody userBody}) async {
    try {
      await dioClient.post(Urls.userRegister, body: userBody.toJson());
      return true;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err registerUser: $e, $stackTrace');
      }
      return false;
    }
  }

}