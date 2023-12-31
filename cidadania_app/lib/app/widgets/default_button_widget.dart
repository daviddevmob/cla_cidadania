import 'package:cidadania_app/app/styles/color_style.dart';
import 'package:cidadania_app/app/styles/text_style.dart';
import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final double? width;
  final Color? customColor;
  const DefaultButtonWidget({super.key, required this.title, this.onTap, this.width, this.customColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
                onTap: onTap,
                child: Container(
                  width:width ?? 300,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: onTap == null ? CustomColors.grey : (customColor ?? CustomColors.primaryColor),
                  ),
                  child: Center(child: Text(title, style:  CustomStyle.medium.copyWith(
                    color: Colors.white,
                  ),)),
                ),
              );
  }
}