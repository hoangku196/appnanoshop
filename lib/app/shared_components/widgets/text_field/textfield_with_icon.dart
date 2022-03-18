import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

class TextFieldWithIcon extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String? value)? validate;
  final Function(String value)? onChange;
  final IconData? iconData;
  final Color color;
  final Color backgroundColor;
  final bool obscureText;
  final int maxLine;
  final bool showIcon;
  final double radiusBorder;

  TextFieldWithIcon({
    this.iconData,
    this.hint,
    this.radiusBorder = 30,
    this.showIcon = true,
    this.backgroundColor = AppColor.color13,
    this.maxLine = 1,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validate,
    this.onChange,
    this.color = AppColor.color21,
  });

  @override
  State<TextFieldWithIcon> createState() => _TextFieldWithIconState();
}

class _TextFieldWithIconState extends State<TextFieldWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(widget.radiusBorder),
      ),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: <Color>[
              AppColor.color20,
              AppColor.color33,
            ],
          ).createShader(bounds);
        },
        child: TextFormField(
          maxLines: widget.maxLine,
          // onTap: onTap,
          // readOnly: readOnly,
          onChanged: widget.onChange,
          obscureText: widget.obscureText,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          // onChanged: onChanged,
          // style: StyleTextApp.textStyle400(color: Colors.black),
          cursorColor: Colors.white,
          style: TextStyleApp.textStyle1,
          validator: widget.validate,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radiusBorder),
              borderSide: BorderSide(
                color: widget.color.withOpacity(0.5),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radiusBorder),
              borderSide: BorderSide(color: Colors.white, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(widget.radiusBorder),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(widget.radiusBorder),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            // errorStyle: StyleTextApp.textStyle400(color: Colors.red),
            errorMaxLines: 1,
            hintText: widget.hint,
            hintStyle: TextStyleApp.textStyle2.copyWith(
              color: widget.color.withOpacity(0.5),
            ),
            prefixIcon: widget.showIcon
                ? Icon(
                    widget.iconData,
                    color: widget.color.withOpacity(0.5),
                    size: 18,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
