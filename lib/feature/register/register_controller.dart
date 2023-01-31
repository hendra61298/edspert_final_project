

import 'package:get/get.dart';
import 'package:submission_finpro/data/repository_impl/auth_repository_impl.dart';

import '../../data/models/request/user/register_user_request.dart';
import '../../domain/repository/auth_repository.dart';

class RegisterController extends GetxController{

  final AuthRepositoryImpl authRepositoryImpl;

  RegisterController({required this.authRepositoryImpl});

  Future<void> registerUser({required UserBody user}) async {
    // TODO: Call AuthRepository.registerUser()
  }
}