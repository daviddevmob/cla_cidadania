import 'dart:convert';
import 'package:cidadania_app/app/models/business_model.dart';
import 'package:cidadania_app/app/routes/route_name.dart';
import 'package:cidadania_app/app/styles/color_style.dart';
import 'package:cidadania_app/app/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class TileServiceWidget extends StatelessWidget {
  final BusinessModel businessModel;
  final bool isAdm;
  const TileServiceWidget({Key? key, required this.businessModel,  this.isAdm = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if(isAdm){
          Routefly.push(RouteName.adm_business, arguments: {"id": businessModel.id.toString(),});
        } else {
          Routefly.push(RouteName.profile, arguments: {"id": businessModel.id.toString(),});
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
