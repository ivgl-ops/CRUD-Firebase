import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget headLine1(String text) {
  return Text(
    text,
    style: GoogleFonts.openSans(
        color: const Color(0xff515360),
        fontSize: 26,
        fontWeight: FontWeight.w700),
  );
}

Widget headLine20(String text) {
  return Text(
    text,
    style: GoogleFonts.openSans(
        color: const Color(0xff515360),
        fontSize: 20,
        fontWeight: FontWeight.w400),
  );
}

Widget recomendations(String text) {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.openSans(
          color: const Color(0xff515360),
          fontSize: 18,
          fontWeight: FontWeight.w400),
    ),
  );
}

Widget resultText(String text) {
  return Container(
    child: Text(
      text,
      style: GoogleFonts.openSans(
        color: const Color(0xff515360),
        fontSize: 90,
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget resultTextRemains(String text) {
  return Text(
    text,
    style: GoogleFonts.openSans(
        color: const Color(0xff515360),
        fontSize: 40,
        fontWeight: FontWeight.w400),
  );
}

Widget headLine40(String text) {
  return Text(
    text,
    style: GoogleFonts.openSans(
        color: const Color(0xff515360),
        fontSize: 50,
        fontWeight: FontWeight.w700),
  );
}

Widget headLine2(String text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: GoogleFonts.openSans(
        color: const Color(0xff515360),
        fontSize: 18,
        fontWeight: FontWeight.w700),
  );
}

Widget normal(String text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: GoogleFonts.openSans(
        color: Colors.greenAccent,
        fontSize: 25,
        fontWeight: FontWeight.w700,
        letterSpacing: 2.0),
  );
}

Widget warningText(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.openSans(
          color: Colors.orangeAccent,
          fontSize: 23,
          fontWeight: FontWeight.w700,
          letterSpacing: 2.0),
    ),
  );
}

Widget dangerText(String text, double digit) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: digit),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.openSans(
          color: Colors.redAccent,
          fontSize: 23,
          fontWeight: FontWeight.w700,
          letterSpacing: 2.0),
    ),
  );
}

Widget headLine2blue(String text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: GoogleFonts.openSans(
        color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),
  );
}

Widget headLine30(String text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: GoogleFonts.openSans(
        color: const Color(0xff515360),
        fontSize: 30,
        fontWeight: FontWeight.w700),
  );
}

Widget headLineDigit(String text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: GoogleFonts.openSans(
        color: const Color(0xff515360),
        fontSize: 40,
        fontWeight: FontWeight.w700),
  );
}

class Constants {
  static LinearGradient gradient = const LinearGradient(colors: <Color>[
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple
  ]);
}
