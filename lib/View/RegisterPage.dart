// ignore_for_file: file_names

import 'package:backing/View/chatPage.dart';
import 'package:backing/View/selectPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

import '../controller/widget/widget.dart';
import 'VerifyPage.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final TextEditingController emailForm = TextEditingController();
final TextEditingController usernameForm = TextEditingController();
final TextEditingController passwordForm = TextEditingController();
final TextEditingController cpasswordForm = TextEditingController();
FirebaseAuth auth = FirebaseAuth.instance;
final languageController = GetStorage();

class _RegisterPageState extends State<RegisterPage> {
  void saveLocale(User user) {
    languageController.write('savedLocale', user);
  }

  String email = '';
  String password = '';
  String confirmPassword = '';

  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 73, 91, 255),
      backgroundColor: const Color.fromARGB(255, 0, 14, 34),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            IconButton(
                onPressed: () {
                  Get.off(const SelectPage(),
                      transition: Transition.leftToRight);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 35,
                )),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    // height: MediaQuery.of(context).size.height,
                    height: 755,

                    width: MediaQuery.of(context).size.width,
                    child: Stack(children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 238, 247, 255),
                            // borderRadius: BorderRadius.circular(2)
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100)),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 120),
                              const Text(
                                'Register',
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              SizedBox(
                                height: 60,
                                width: 350,
                                child: TextFormField(
                                  controller: emailForm,
                                  autocorrect: false,
                                  decoration: const InputDecoration(
                                    labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 199, 199, 199),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    suffixIcon: Icon(
                                      Icons.email,
                                      size: 30,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(21),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 56, 56, 56),
                                      ),
                                    ),
                                    labelText: 'Email',
                                  ),
                                  onChanged: (value) {
                                    email = value;
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 60,
                                width: 350,
                                child: TextFormField(
                                  controller: usernameForm,
                                  autocorrect: false,
                                  decoration: const InputDecoration(
                                    labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 199, 199, 199),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    suffixIcon: Icon(
                                      Icons.person,
                                      size: 30,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(21),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 56, 56, 56),
                                      ),
                                    ),
                                    labelText: 'Username',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 60,
                                width: 350,
                                child: TextFormField(
                                  controller: passwordForm,
                                  autocorrect: false,
                                  decoration: const InputDecoration(
                                    labelStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 194, 194, 194),
                                        fontWeight: FontWeight.w500),
                                    suffixIcon: Icon(
                                      Icons.password,
                                      size: 30,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(21),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 56, 56, 56),
                                      ),
                                    ),
                                    labelText: 'Password',
                                  ),
                                  onChanged: (value) {
                                    password = value;
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 60,
                                width: 350,
                                child: TextFormField(
                                  controller: cpasswordForm,
                                  autocorrect: false,
                                  
                                  decoration: const InputDecoration(
                                    labelStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 194, 194, 194),
                                        fontWeight: FontWeight.w500),
                                    suffixIcon: Icon(
                                      Icons.password,
                                      size: 30,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(21),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 56, 56, 56),
                                      ),
                                    ),
                                    labelText: 'Confirm password',
                                  ),
                                  onChanged: (value) {
                                    confirmPassword = value;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              myb("Register", Icons.login, false, () async {
                                if (password == confirmPassword) {
                                  try {
                                    UserCredential userCredential =
                                        await FirebaseAuth.instance
                                            .createUserWithEmailAndPassword(
                                      email: email,
                                      password: password,
                                    );
                                    User? user =
                                        FirebaseAuth.instance.currentUser;
                                    email = '';
                                    password = '';
                                    confirmPassword = '';
                                    Get.off(const ChatPage());

                                    // if (user != null && !user.emailVerified) {
                                    //   await user.sendEmailVerification();
                                    //   Get.to(const VerifyPage());
                                    // }
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      Get.snackbar(
                                        'Weak Password',
                                        'The password provided is too weak.',
                                        snackPosition: SnackPosition.BOTTOM,
                                        icon: const Icon(
                                          Icons.error,
                                          size: 25,
                                        ),
                                        margin: const EdgeInsets.all(15),
                                      );
                                      Get.snackbar(
                                        'Email already exist',
                                        'The account already exists for that email.',
                                        snackPosition: SnackPosition.BOTTOM,
                                        icon: const Icon(
                                          Icons.error,
                                          size: 25,
                                        ),
                                        margin: const EdgeInsets.all(15),
                                      );
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      print(
                                          'The account already exists for that email.');
                                    }
                                  } catch (e) {
                                    Get.snackbar(
                                      'Error',
                                      e.toString(),
                                      snackPosition: SnackPosition.BOTTOM,
                                      icon: const Icon(
                                        Icons.error,
                                        size: 25,
                                      ),
                                      margin: const EdgeInsets.all(15),
                                    );
                                    print(e);
                                  }
                                } else {
                                  Get.snackbar(
                                    'Error',
                                    'password and confirm password form is not match',
                                    snackPosition: SnackPosition.BOTTOM,
                                    icon: const Icon(
                                      Icons.error,
                                      size: 25,
                                    ),
                                    margin: const EdgeInsets.all(15),
                                  );
                                }

                                // Get.to(VerifyPage());
                              }),
                              const SizedBox(height: 50),
                              TextButton(
                                onPressed: () {
                                  Get.to(
                                    const LoginPage(),
                                    transition: Transition.native,
                                  );
                                },
                                child: const Text(
                                  'Already have an account?',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
