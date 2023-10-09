import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:flutter/material.dart';

class DefaultTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final double? width;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;

  const DefaultTextFieldWidget({super.key, this.hintText, this.controller, this.width, this.prefixIcon, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 300,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
                     textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: prefixIcon == null ? null : Icon(prefixIcon, color: CustomColors.primaryColor),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                hintStyle: new TextStyle(color: CustomColors.primaryColor),
                                hintText: hintText,),
                  ),
    );
  }
}