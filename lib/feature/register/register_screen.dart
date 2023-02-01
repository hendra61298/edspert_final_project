
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:submission_finpro/common/style/app_color.dart';
import 'package:submission_finpro/data/models/request/user/register_user_request.dart';
import 'package:submission_finpro/feature/register/register_controller.dart';

import '../../core/router/routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _fullNameTextController = TextEditingController();
  final TextEditingController _schoolNameTextController = TextEditingController();

  String? kelas;
  String jenisKelamin = '';

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (RegisterController controller) {
        if(controller.currentEmail != null){
          _emailTextController.text = controller.currentEmail!;
        }

        return controller.currentEmail !=null ?Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.white,
            title: const Text(
              'Yuk isi data diri',
              style: TextStyle(
                color: AppColor.black,
              ),
            ),
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(28),
              children: [
                const Text('Email'),
                TextFormField(
                  enabled: false,
                  controller: _emailTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Email',
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                const SizedBox(height: 30),
                const Text('Nama Lengkap'),
                TextFormField(
                  controller: _fullNameTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Nama Lengkap',
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                ),
                const SizedBox(height: 30),
                const Text('Nama Sekolah'),
                TextFormField(
                  controller: _schoolNameTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Nama Sekolah',
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                ),
                const SizedBox(height: 30),
                const Text('Pilih Kelas'),
                DropdownButton<String?>(
                  value: kelas,
                  items: ['10', '11', '12']
                      .map((element) => DropdownMenuItem<String?>(
                    value: element,
                    child: Text('Kelas $element'),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value != null) {
                        kelas = value;
                      }
                    });
                  },
                ),
                const SizedBox(height: 30),
                const Text('Pilih Gender'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              jenisKelamin = 'Laki-Laki';
                            });
                          },
                          child: Container(
                            color: jenisKelamin == 'Laki-Laki' ? Colors.blue : Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Text(
                              'Laki-Laki',
                              style: TextStyle(
                                color: jenisKelamin == 'Laki-Laki' ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              jenisKelamin = 'Perempuan';
                            });
                          },
                          child: Container(
                            color: jenisKelamin == 'Perempuan' ? Colors.blue : Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Text('Perempuan',
                                style: TextStyle(
                                  color: jenisKelamin == 'Perempuan' ? Colors.white : Colors.black,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() == true) {
                      if (kelas != null) {
                        if (jenisKelamin != '') {
                          final registUser = UserBody(fullName: _fullNameTextController.text,
                              email: controller.currentEmail?? "",
                              schoolName: _schoolNameTextController.text,
                              schoolLevel: kelas!,
                              schoolGrade: "SMA",
                              gender: jenisKelamin,
                              photoUrl: "https://api.duniagames.co.id/api/content/upload/file/11297623561589089919.jpg"
                          );
                          controller.registerUser(user: registUser);
                        } else {
                          Get.snackbar(
                            'Invalid!!!',
                            'Jenis Kelamin Harus Diisi!',
                            backgroundColor: Colors.red,
                          );
                        }
                      } else {
                        Get.snackbar(
                          'Invalid!!!',
                          'Kelas Harus Diisi!',
                          backgroundColor: Colors.red,
                        );
                      }
                    } else {
                      Get.snackbar('Invalid!!', '.......');
                    }
                  },
                  child: const Text('REGISTER'),
                ),
              ],
            ),
          ),
        ): const Center(child: CircularProgressIndicator(),);
      }
    );
  }
}
