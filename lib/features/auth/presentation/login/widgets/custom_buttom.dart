import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/dimention.dart';

class CustomButton extends StatelessWidget {
   CustomButton({Key? key, required this.text , this.onTap}) : super(key: key);
  final String text;
  VoidCallback? onTap ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(16),
        ),
        width: dimWidth(context),
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.staatliches(fontSize: 36, color: Colors.white),
        ),
      ),
    );
  }
}
