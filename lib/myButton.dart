import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: Colors.grey, shape: BoxShape.circle),
        child: Center(
            child: Text(
              "0",
              style: TextStyle(color: Colors.black, fontSize: 25),
            )),
      ),
    );
  }
}
