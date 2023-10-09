import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:cidadania_app/src/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const DefaultButtonWidget({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
                onTap: onTap,
                child: Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: CustomColors.primaryColor,
                  ),
                  child: Center(child: Text(title, style:  CustomStyle.medium.copyWith(
                    color: Colors.white,
                  ),)),
                ),
              );
  }
}