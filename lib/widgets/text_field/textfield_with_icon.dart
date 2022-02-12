import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';

class TextFieldWithIcon extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function? validate;
  final IconData? iconData;

  TextFieldWithIcon({
    this.iconData,
    this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validate,
  });

  @override
  State<TextFieldWithIcon> createState() => _TextFieldWithIconState();
}

class _TextFieldWithIconState extends State<TextFieldWithIcon> {
  bool check = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: TextFormField(
        // onTap: onTap,
        // readOnly: readOnly,
        obscureText: check,
        controller: widget.controller,
        keyboardType: widget.keyboardType,

        // onChanged: onChanged,
        // style: StyleTextApp.textStyle400(color: Colors.black),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: color2, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: color1, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color1, width: 1),
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          // errorStyle: StyleTextApp.textStyle400(color: Colors.red),
          errorMaxLines: 1,
          hintText: widget.hint,
          hintStyle: textStyle2,
          prefixIcon: Icon(
            widget.iconData,
            color: color2,
            size: 18,
          ),
        ),
      ),
    );
  }
}
