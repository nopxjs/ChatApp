// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/widget/widget.dart';

import 'RegisterPage.dart';
import 'login.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 14, 34),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 600,
              height: 410,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 229, 243, 255),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(120)),
              ),
            ),
            const SizedBox(height: 50),
            const SizedBox(
              // height: 300,
              width: 250,
              child: Text(
                "You don't have an account?",
                style: TextStyle(
                  color: Color.fromARGB(255, 229, 243, 255),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Container(
            //   width: 230,
            // ),
            const SizedBox(height: 60),
            myb("Register", Icons.login, false, () {
              Get.to(
                RegisterPage(),
                transition: Transition.rightToLeft,
              );
            }),
            const SizedBox(height: 13),
            myb("Login", Icons.person, true, () {
              Get.to(
                LoginPage(),
                transition: Transition.rightToLeft,
              );
            }),
          ],
        ),
      ),
    );
  }
}
