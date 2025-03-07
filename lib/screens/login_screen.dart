import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pmsn_2025/utils/global_values.dart';
//import 'package:pmsn_2025/screens/list_students_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isValidating = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController loginUserController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    final txtUser = TextFormField(
      controller: loginUserController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Introduce el usuario",
      ),
    );

    final txtPass = TextFormField(
      controller: loginPasswordController,
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Introduce la contraseña",
      ),
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.1,
            fit: BoxFit.cover,
            image: AssetImage("assets/fondo.jpg"),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 500,
              child: ValueListenableBuilder(
                valueListenable: GlobalValues.isValidating,
                builder: (context, value, child) {
                  return value ? CircularProgressIndicator() : Container();
                },
              ),
            ),
            Positioned(
              top: 150,
              child: Lottie.asset(
                "assets/tecnm.json",
                height: 250,
              ),
            ),
            Positioned(
              bottom: 50,
              child: Container(
                padding: EdgeInsets.all(10),
                height: 400,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      txtUser,
                      const SizedBox(
                        height: 10,
                      ),
                      txtPass,
                      SizedBox(
                        height: 10,
                      ),
                      CheckboxListTile(
                        title: Text("Mantenerme activo"),
                        value: isActive,
                        onChanged: (bool? value) {
                          setState(() {
                            isActive = value ?? false;
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () async {
                          final SharedPreferences preferences =
                              await SharedPreferences.getInstance();

                          final String? username =
                              preferences.getString('username');
                          final String? email = preferences.getString('email');
                          final String? password =
                              preferences.getString('password');

                          GlobalValues.isValidating.value = true;
                          Future.delayed(
                            Duration(milliseconds: 1000),
                          ).then((value) async {
                            GlobalValues.isValidating.value = false;

                            if (username == loginUserController.text &&
                                password == loginPasswordController.text) {
                              await preferences.setBool('isActive', isActive);
                              Navigator.pushNamed(context, "/dash");
                            } else {
                              ArtSweetAlert.show(
                                  context: context,
                                  artDialogArgs: ArtDialogArgs(
                                      type: ArtSweetAlertType.danger,
                                      title: 'Error',
                                      text:
                                          'Credenciales de Acceso Invalidas'));
                              /*ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Credenciales de Acceso Invalidas")));*/
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.login,
                            size: 40,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          GlobalValues.userImage.value = null;
                          usernameController.text = "";
                          emailController.text = "";
                          passwordController.text = "";
                          _userRegister(context);
                        },
                        child: Image.asset(
                          "assets/singup.png",
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _savePreferences() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('username', usernameController.text);
    await preferences.setString('email', emailController.text);
    await preferences.setString('password', passwordController.text);
    if (GlobalValues.userImage.value != null) {
      await preferences.setString(
          'userImage', GlobalValues.userImage.value!.path);
    }
  }

  Future<void> _userRegister(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text('User Register')),
          content: Container(
            height: 400,
            width: 300,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _showImagePickerOptions,
                    child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[300],
                        child: ValueListenableBuilder<File?>(
                          valueListenable: GlobalValues.userImage,
                          builder: (context, value, child) {
                            return CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.grey[300],
                              backgroundImage:
                                  value == null ? null : FileImage(value),
                              child: value == null
                                  ? Icon(Icons.camera_alt,
                                      size: 40, color: Colors.grey[600])
                                  : null,
                            );
                          },
                        )),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(hintText: 'Username'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa un nombre de usuario';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: 'User Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa un email';
                      }
                      final emailRegex = RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                      if (!emailRegex.hasMatch(value)) {
                        return 'Por favor ingresa un email válido';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(hintText: 'User Password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa una contraseña';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _savePreferences();
                        Navigator.pop(context);
                        ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                                type: ArtSweetAlertType.success,
                                title: 'Sing Up',
                                text: 'Registro de Usuario Completado'));
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.person_add,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Galería'),
              onTap: () {
                _pickImageFromSource(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Cámara'),
              onTap: () {
                _pickImageFromSource(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImageFromSource(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      GlobalValues.userImage.value = File(pickedFile.path);
    }
  }
}
