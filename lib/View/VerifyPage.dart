import 'package:backing/View/RegisterPage.dart';
import 'package:backing/View/chatPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/widget/widget.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final TextEditingController verifyForm = TextEditingController();

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
                  Get.back();
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
                              const SizedBox(height: 100),
                              const Text(
                                'Verify',
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'We sent verify code to ${emailForm.text}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 19,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 60,
                                width: 370,
                                child: TextFormField(
                                  controller: verifyForm,
                                  autocorrect: false,
                                  decoration: const InputDecoration(
                                    labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 199, 199, 199),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    suffixIcon: Icon(
                                      Icons.verified_user,
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
                                    labelText: 'Verify code',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 50),
                              myb(
                                "Verify",
                                Icons.verified_user_outlined,
                                false,
                                () async {
                                  User? user =
                                      FirebaseAuth.instance.currentUser;
                                  if (user != null && user.emailVerified) {
                                    print('object');
                                    Get.to(const ChatPage());
                                  } else {
                                    print('e');
                                  }
                                },
                              ),
                              const SizedBox(height: 60),
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
