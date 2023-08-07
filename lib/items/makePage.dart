import 'package:flutter/material.dart';

Widget makePage({image, title, content, text}) {
  return Container(
    padding: const EdgeInsets.only(left: 50, right: 50),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(image),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.green,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              content,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Text(text ?? '',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ))
          ],
        )
      ],
    ),
  );
}
