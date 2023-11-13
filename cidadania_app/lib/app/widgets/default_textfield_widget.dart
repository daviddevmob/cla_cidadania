import 'package:cidadania_app/app/styles/color_style.dart';
import 'package:cidadania_app/app/styles/text_style.dart';
import 'package:cidadania_app/app/widgets/responsive.dart';
import 'package:flutter/material.dart';

class DefaultTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final double? width;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? label;
  final int? maxSize;
  final int? maxLines;

  const DefaultTextFieldWidget({super.key, this.hintText, this.controller, this.width, this.prefixIcon, this.obscureText = false, this.label, this.maxSize, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Responsive.sizeWidthFields(context),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
                     textAlign: TextAlign.start,
                     maxLength: maxSize,
                     textAlignVertical: TextAlignVertical.top,
                     maxLines: obscureText ? 1 : maxLines,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: maxLines != null ? 25 : 10, 
                                    horizontal: 10,
                                  ),
                                filled: true,
                                fillColor: Colors.white,
                                labelText: label,
                                labelStyle: CustomStyle.medium,
                                prefixIcon: prefixIcon == null ? null : Icon(prefixIcon, color: CustomColors.primaryColor),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: CustomColors.primaryColor, width: 1),
                                    borderRadius: BorderRadius.all(Radius.circular(10),
                                    )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: CustomColors.lightGrey, width: .5),
                                    borderRadius: BorderRadius.all(Radius.circular(10),
                                    )
                                  ),
                                hintStyle: new TextStyle(color: CustomColors.primaryColor),
                                hintText: hintText,
                              ),
                  ),
    );
  }
}