import 'package:flutter/material.dart';
import 'package:untitled/constant.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key? key, required this.hint, this.iconData, required this.controller})
      : super(key: key);
  final String hint;
  final IconData? iconData;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obs = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: TextFormField(
            validator: (data) {
              if (data == "") {
                return ("fill requirement field");
              }
            },
            obscureText:
                widget.hint == "Password" || widget.hint == " Confirm Password"
                    ? obs
                    : false,
            style: const TextStyle(color: Colors.white),
            cursorColor: mainColor,
            controller: widget.controller,
            decoration: InputDecoration(
              suffixIcon: widget.hint == "Password" ||
                      widget.hint == " Confirm Password"
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          obs = !obs;
                        });
                      },
                      child: obs
                          ? const Icon(
                              Icons.visibility,
                              color: Colors.grey,
                            )
                          : const Icon(Icons.visibility_off))
                  : null,
              suffixIconColor: Colors.grey,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: mainColor, width: 1.0),
              ),
              hintStyle: const TextStyle(color: Colors.grey),
              iconColor: Colors.grey,
              hintText: widget.hint,
              icon: Icon(widget.iconData),
            )),
      ),
    );
  }
}
