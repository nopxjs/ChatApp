// ignore_for_file: file_names

import 'package:backing/View/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _LoginPState();
}

class _LoginPState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 243, 255),
      // backgroundColor: Color.fromARGB(255, 255, 231, 231),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 600,
              height: 200,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 0, 14, 34),
                // color: Color.fromARGB(255, 34, 0, 0),

                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(80)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          Get.to(
                            ProfilePage(),
                            transition: Transition.cupertino,
                          );
                        },
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      const Text(
                        'ModyChat',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      IconButton(
                        onPressed: () async {
                          Get.back();
                          await FirebaseAuth.instance.signOut();
                        },
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 70,
                    width: 280,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 2, 18, 46),
                        // color: Color.fromARGB(255, 46, 2, 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        ratioButton("Chats", 0),
                        ratioButton("Status", 1),
                        ratioButton("Calls", 2),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "All Chats",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    // SizedBox(
                    //   width: 150,
                    // ),
                    // IconButton(onPressed: () {}, icon: Icon(Icons.settings))
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Friends",
                      style: TextStyle(
                          color: Color.fromARGB(255, 110, 110, 110),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  int cindex = 0;

  void changeIndex(int index) {
    setState(() {
      cindex = index;
    });
  }

  Widget ratioButton(String value, int index) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: cindex == index
              ? const Color.fromARGB(255, 0, 14, 34)
              : const Color.fromARGB(0, 255, 193, 7),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: cindex == index
                ? const Color.fromARGB(255, 0, 14, 34)
                : const Color.fromARGB(0, 255, 193, 7),
            width: 2,
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 6.0),
        child: TextButton(
          onPressed: () {
            changeIndex(index);
          },

          child: Text(
            value,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),

          // child: Text(
          //   value,
          //   style: TextStyle(
          //     fontSize: 22,
          //     fontWeight: FontWeight.bold,
          //     color: cindex == index ? Colors.white : color,
          //   ),
          // ),
        ),
      ),
    );
  }
}
