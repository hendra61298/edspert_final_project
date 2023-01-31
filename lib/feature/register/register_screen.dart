
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:submission_finpro/common/style/app_color.dart';

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
    return Scaffold(
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
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
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
            DropdownButton<String?>(
              value: kelas,
              items: ['10', '11', '12']
                  .map((element) => DropdownMenuItem<String?>(
                child: Text('Kelas $element'),
                value: element,
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
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        jenisKelamin = 'Laki-Laki';
                      });
                    },
                    child: Container(
                      color: jenisKelamin == 'Laki-Laki' ? Colors.green : Colors.white,
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
                      color: jenisKelamin == 'Perempuan' ? Colors.green : Colors.white,
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
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate() == true) {
                  if (kelas != null) {
                    if (jenisKelamin != '') {
                      // TODO: call RegistFormController.registerUser()
                      // Sementara redirect ke Dashboard Page, tapi nanti harus call RegistFormController.registerUser()
                      Get.offAllNamed(Routes.dashboard);
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
                  Get.snackbar('Valid!!!', '.......', snackPosition: SnackPosition.BOTTOM);
                } else {
                  Get.snackbar('Invalid!!', '.......');
                }
              },
              child: const Text('REGISTER'),
            ),
          ],
        ),
      ),
    );
  }
}