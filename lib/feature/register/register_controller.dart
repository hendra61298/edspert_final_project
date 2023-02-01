

import 'package:get/get.dart';
import 'package:submission_finpro/data/repository_impl/auth_repository_impl.dart';

import '../../core/router/routes.dart';
import '../../data/models/request/user/register_user_request.dart';
import '../../domain/repository/auth_repository.dart';

class RegisterController extends GetxController{

  final AuthRepositoryImpl authRepositoryImpl;

  RegisterController({required this.authRepositoryImpl});

  String? currentEmail;
  String? email;
  @override
  void onInit() {
    super.onInit();
    currentEmail = Get.arguments as String;
  }

  Future<void> registerUser({required UserBody user}) async {
      bool isSuccess = await authRepositoryImpl.registerUser(userBody: user);
      if(isSuccess){
        Get.offAllNamed(Routes.dashboard);
      }else{
        Get.showSnackbar(const GetSnackBar(
          title: 'Error',
          message: 'Failed Create User',
        ));
      }
  }
}