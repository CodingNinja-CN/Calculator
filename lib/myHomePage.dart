import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/myButton.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                        alignment: Alignment.bottomRight,
                        child: AutoSizeText(
                          userInput,
                          style: const TextStyle(color: Colors.white, fontSize: 60),
                          minFontSize: 20,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: AutoSizeText(
                          answer,
                          style: const TextStyle(color: Colors.white, fontSize: 60),
                          minFontSize: 20,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      MyButton(
                        title: 'AC',
                        onPress: () {
                          userInput = '';
                          answer = '';
                          setState(() {});
                        },
                      ),
                      MyButton(
                          title: 'π',
                          onPress: () {
                            userInput += 'π';
                            answer = '';
                            setState(() {});
                          }),
                      MyButton(
                          title: '%',
                          onPress: () {
                            userInput += '%';
                            setState(() {});
                          }),
                      MyButton(
                          title: '/',
                          color: const Color(0xffdb6307),
                          onPress: () {
                            userInput += '/';
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '7',
                        onPress: () {
                          userInput += '7';
                          setState(() {});
                        },
                      ),
                      MyButton(
                          title: '8',
                          onPress: () {
                            userInput += '8';
                            setState(() {});
                          }),
                      MyButton(
                          title: '0',
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          }),
                      MyButton(
                          title: 'x',
                          color: const Color(0xffdb6307),
                          onPress: () {
                            userInput += 'x';
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '4',
                        onPress: () {
                          userInput += '4';
                          setState(() {});
                        },
                      ),
                      MyButton(
                          title: '5',
                          onPress: () {
                            userInput += '5';
                            setState(() {});
                          }),
                      MyButton(
                          title: '6',
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          }),
                      MyButton(
                          title: '-',
                          color: const Color(0xffdb6307),
                          onPress: () {
                            userInput += '-';
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '1',
                        onPress: () {
                          userInput += '1';
                          setState(() {});
                        },
                      ),
                      MyButton(
                          title: '2',
                          onPress: () {
                            userInput += '2';
                            setState(() {});
                          }),
                      MyButton(
                          title: '3',
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          }),
                      MyButton(
                          title: '+',
                          color: const Color(0xffdb6307),
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '0',
                        onPress: () {
                          userInput += '0';
                          setState(() {});
                        },
                      ),
                      MyButton(
                          title: '.',
                          onPress: () {
                            userInput += '.';
                            setState(() {});
                          }),
                      MyButton(
                          title: 'DEL',
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          }),
                      MyButton(
                          title: '=',
                          color: const Color(0xffdb6307),
                          onPress: calcAns),
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

  void calcAns() {
    if (userInput.isEmpty) {
      setState(() {
        answer = '';
      });
      return;
    }

    try {
      String finalInput = userInput.replaceAll('x', '*');
      finalInput = finalInput.replaceAllMapped(
        RegExp(r'(\d)(π)'),
        (match) => '${match.group(1)}*${match.group(2)}',
      );
      finalInput = finalInput.replaceAll('π', '3.14159');

      Parser p = Parser();
      Expression exp = p.parse(finalInput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      setState(() {
        answer = eval.toString();
      });
    } catch (e) {
      setState(() {
        answer = "Error";
      });
    }
  }
}
