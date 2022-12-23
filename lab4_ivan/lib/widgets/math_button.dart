import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MathButton extends StatelessWidget {
  String text;
  MathButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 238, 234, 234),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Color(0xff6572C2), fontSize: 29),
        ),
      ),
    );
  }
}
