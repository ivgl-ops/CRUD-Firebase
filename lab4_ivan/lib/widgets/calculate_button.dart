import 'package:flutter/material.dart';
import 'package:shared_prefs_example/const.dart';

class CalculateButton extends StatelessWidget {
  String title;
  CalculateButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      height: 50,
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        color: const Color(0xff6572C2),
      ),
      child: Center(child: headLine2blue(title)),
    );
  }
}
