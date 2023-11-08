import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:cidadania_app/src/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultRadioButtonWidget extends StatelessWidget {
  final List<DefaultRadioModel> list;
  final String labe;
  final double? width;
  const DefaultRadioButtonWidget({super.key, required this.list, required this.labe, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labe, style: CustomStyle.medium, textAlign: TextAlign.start,),
          Column(
            children: list.map((e) => 
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: e.onTap,
                    child: Container(
                     height: 35,
                     width: 35,
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: CustomColors.primaryColor,
                      ),
                      color: CustomColors.cardBackgroud,
                     ),
                     child: e.value 
                     ? Center(
                      child: Icon(CupertinoIcons.check_mark, color: CustomColors.primaryColor,),
                     ) : SizedBox(),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(e.label, style: CustomStyle.medium,),
                ],
                ),
            )
            ).toList(),
          )
        ],
      ),
    );
  }
}

class DefaultRadioModel {
  final bool value;
  final String label;
  final Function()? onTap;

  DefaultRadioModel({required this.value, required this.label, this.onTap});
}