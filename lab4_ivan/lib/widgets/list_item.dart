import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListItem extends StatelessWidget {
  String bmi;
  String date;
  ListItem({Key? key, required this.bmi, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.only(top: 15, left: 10, bottom: 5),
          child: Text(
            'Date $date',
            style: GoogleFonts.openSans(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5, left: 10, bottom: 5),
          child: Text(
            'Bmi $bmi',
            style: GoogleFonts.openSans(
              fontSize: 17,
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        )
      ]),
    );
  }
}
