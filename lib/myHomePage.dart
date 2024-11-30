import 'package:calculator/myButton.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      MyButton(),
                      MyButton(),
                      MyButton(),
                      MyButton(),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
