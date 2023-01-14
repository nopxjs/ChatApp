import 'package:backing/View/selectPage.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'View/firebase_options.dart';
import 'package:flutter/material.dart';

import 'controller/widget/widget.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                "Let's connect with each other",
                style: TextStyle(
                  color: Color.fromARGB(255, 229, 243, 255),
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              width: 230,
              child: Text(
                "A message is a discrate communciation intended by the source consumption.",
                style: TextStyle(
                  color: Color.fromARGB(255, 129, 141, 146),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 60),
            myb(
              "Let's Start",
              Icons.arrow_circle_right_sharp,
              false,
              () {
                Get.to(const SelectPage(), transition: Transition.rightToLeft);
              },
            )
          ],
        ),
      ),
    );
  }
}
