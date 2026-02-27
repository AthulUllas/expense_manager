import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.text,
    required this.width,
    required this.onTap,
  });
  final String text;
  final double width;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(seconds: 2),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 50, 46, 203),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 60,
        width: width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.plusJakartaSans(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
