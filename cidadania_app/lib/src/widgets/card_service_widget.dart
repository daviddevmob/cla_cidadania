import 'dart:convert';

import 'package:cidadania_app/src/models/business_model.dart';
import 'package:cidadania_app/src/routes/route_name.dart';
import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:cidadania_app/src/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardServiceWidget extends StatelessWidget {
  final BusinessModel businessModel;
  final bool isAdm;
  const CardServiceWidget({super.key, required this.businessModel, required this.isAdm});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(isAdm){
          Get.toNamed(RouteName.adm_business, parameters: {"id": businessModel.id.toString(),});
        } else {
          Get.toNamed(RouteName.profile, parameters: {"id": businessModel.id.toString(),});
        }
      },
      child: Card(
        color: CustomColors.cardBackgroud,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Container(
            width:300,
            height:300,
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage:businessModel.image == null
                  ? null
                  : MemoryImage(
                  base64Decode(businessModel.image!.split("base64,").last),
                  ),
                  radius: 60,
                  backgroundColor:businessModel.image == null ? null : CustomColors.primaryColor,
                  onBackgroundImageError:businessModel.image == null ? null : (exception, stackTrace) => SizedBox(),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  businessModel.name,
                  style: CustomStyle.medium,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  businessModel.category + " | "+(businessModel.delivery ? "Entrega em domicílio" : ""),
                  style: CustomStyle.little,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}