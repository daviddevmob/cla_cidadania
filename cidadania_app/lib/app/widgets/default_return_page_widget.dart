import 'package:cidadania_app/app/styles/color_style.dart';
import 'package:cidadania_app/app/styles/text_style.dart';
import 'package:cidadania_app/app/widgets/default_button_widget.dart';
import 'package:flutter/material.dart';

class DefaultReturnPageWidget extends StatelessWidget {
  final Function()? onTap;
  const DefaultReturnPageWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Negócio não encontrado",
                  textAlign: TextAlign.center,
                  style: CustomStyle.title.copyWith(
                    color: CustomColors.textColor,
                  ),
                ),
                DefaultButtonWidget(
                  title: "Retornar para o Menu",
                  onTap:onTap,
                ),
              ],
            ),
      );
  }
}