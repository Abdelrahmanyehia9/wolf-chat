import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorLoadingChats extends StatelessWidget {
  const ErrorLoadingChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text("Something Went Wrong please try again later , " ,
    style:  GoogleFonts.staatliches(fontSize: 28),),
        );
  }
}
