import 'package:flutter/material.dart';

Container myb(txt, ic, outline, test) {
  return Container(
    decoration: BoxDecoration(
      border:
          Border.all(color: const Color.fromARGB(255, 21, 124, 172), width: 5),
      color: outline == false
          ? const Color.fromARGB(255, 21, 124, 172)
          : const Color.fromARGB(255, 248, 252, 255),
      borderRadius: BorderRadius.circular(20),
    ),
    height: 60,
    width: 220,
    child: TextButton(
      onPressed: test,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            txt,
            style: TextStyle(
                color: outline == false
                    ? Colors.white
                    : const Color.fromARGB(255, 21, 124, 172),
                fontWeight: FontWeight.w600,
                fontSize: 22),
          ),
          const SizedBox(width: 15),
          Icon(ic,
              size: 32,
              // Icons.arrow_right_outlined,
              color: outline == false
                  ? Colors.white
                  : const Color.fromARGB(255, 21, 124, 172))
        ],
      ),
    ),
  );
}
