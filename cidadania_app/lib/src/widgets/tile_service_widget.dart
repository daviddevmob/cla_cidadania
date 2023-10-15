import 'dart:convert';
import 'package:cidadania_app/src/models/business_model.dart';
import 'package:cidadania_app/src/routes/route_name.dart';
import 'package:cidadania_app/src/screens/profile_screen.dart';
import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:cidadania_app/src/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TileServiceWidget extends StatelessWidget {
  final BusinessModel businessModel;
  final bool isAdm;
  const TileServiceWidget({Key? key, required this.businessModel,  this.isAdm = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if(isAdm){
          Get.toNamed(RouteName.adm_business, parameters: {"id": businessModel.id.toString(),});
        } else {
          Get.to(()=> ProfileScreen(businessId: businessModel.id,));
        }
      },
      leading: CircleAvatar(
        backgroundImage:businessModel.image == null
        ? null
        : MemoryImage(
         base64Decode(businessModel.image!.split("base64,").last),
        ),
        backgroundColor:businessModel.image == null ? null : CustomColors.primaryColor,
        onBackgroundImageError:businessModel.image == null ? null : (exception, stackTrace) => SizedBox(),
      ),
      title: Text(
        businessModel.name,
        style: CustomStyle.medium,
      ),
      subtitle: Text(
        businessModel.category + " | "+(businessModel.delivery ? "Entrega em domicílio" : ""),
        style: CustomStyle.little,
      ),
      trailing: Icon(CupertinoIcons.forward, color: CustomColors.primaryColor,),
    );
  }
}
