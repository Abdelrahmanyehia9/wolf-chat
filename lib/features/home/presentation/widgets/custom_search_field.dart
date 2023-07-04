import 'package:flutter/material.dart';
import 'package:untitled/constant.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: myGrey),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: TextFormField(
                cursorColor: mainColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search ...",
                  suffixIcon: Image.asset("assets/icons/Search.png"),
                  hintStyle:
                      const TextStyle(fontFamily: "myfont", fontSize: 20),
                )),
          )),
    );
  }
}
