import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  const MyButton({
    super.key,
    required this.title,
    this.color = const Color(0xff5c5e5c),
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                color: color, shape: BoxShape.circle),
            child: Center(
                child: Text(
                  title,
                  style: const TextStyle(color:Colors.white,fontSize: 25),
                )),
          ),
        ),
      ),
    );
  }
}
