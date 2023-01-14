import 'package:backing/View/selectPage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:get/get.dart';
import '../controller/widget/widget.dart';
import 'RegisterPage.dart';
import 'VerifyPage.dart';
import 'chatPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _auth = FirebaseAuth.instance;
User? curUser = FirebaseAuth.instance.currentUser;

class Authentication {
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }

    return user;
  }
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController lusernameForm = TextEditingController();
  final TextEditingController passwordForm = TextEditingController();
  late String email;
  late String password;
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
                    height: 756,
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
                                'Login',
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
                                  controller: lusernameForm,
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
                              const SizedBox(height: 15),
                              SizedBox(
                                width: 400,
                                height: 30,
                                // decoration: BoxDecoration(
                                //     color: Colors.grey,
                                //     borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 25),
                                    Container(
                                      width: 101,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 139, 139, 139),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      'or sign-in with:',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 139, 139, 139),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 139, 139, 139),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 25),
                              Container(
                                height: 50,
                                width: 250,
                                child: SignInButton(
                                  Buttons.Google,
                                  elevation: 0.8,
                                  onPressed: () {
                                    Future<void> _handleSignIn() async {
                                      try {
                                        await _googleSignIn.signIn();
                                        Get.off(ChatPage());
                                        print('object');
                                      } catch (error) {
                                        print(error);
                                      }
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              myb("Login", Icons.login, false, () async {
                                try {
                                  final user =
                                      await _auth.signInWithEmailAndPassword(
                                          email: email, password: password);
                                  if (user != null) {
                                    Get.off(
                                      const ChatPage(),
                                      transition: Transition.rightToLeft,
                                    );
                                  }

                                  Get.snackbar(
                                    'Logged in!',
                                    'Welcome back ${(lusernameForm.text).toString()}!',
                                    snackPosition: SnackPosition.BOTTOM,
                                    icon: const Icon(
                                      Icons.person,
                                      size: 25,
                                    ),
                                    margin: const EdgeInsets.all(15),
                                  );
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    Get.snackbar(
                                      'Login failed',
                                      'No user found for that email.',
                                      snackPosition: SnackPosition.BOTTOM,
                                      icon: const Icon(
                                        Icons.error,
                                        size: 25,
                                      ),
                                      margin: const EdgeInsets.all(15),
                                    );
                                  } else if (e.code == 'wrong-password') {
                                    Get.snackbar(
                                      'Wrong password',
                                      'Wrong password provided for that user.',
                                      snackPosition: SnackPosition.BOTTOM,
                                      icon: const Icon(
                                        Icons.error,
                                        size: 25,
                                      ),
                                      margin: const EdgeInsets.all(15),
                                    );
                                  }
                                } catch (e) {
                                  Get.snackbar(
                                    'Unknown error',
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
                              }),
                              const SizedBox(height: 50),
                              TextButton(
                                onPressed: () {
                                  Get.to(
                                    const RegisterPage(),
                                    transition: Transition.native,
                                  );
                                },
                                child: const Text(
                                  'Not have an account?',
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

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);
