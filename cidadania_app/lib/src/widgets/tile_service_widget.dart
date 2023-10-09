import 'package:cidadania_app/src/routes/route_name.dart';
import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:cidadania_app/src/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TileServiceWidget extends StatelessWidget {
  const TileServiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.toNamed(RouteName.profile);
      },
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          "https://images.unsplash.com/photo-1528952686551-542043782ab9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1471&q=80",
        ),
        backgroundColor: CustomColors.primaryColor,
        onBackgroundImageError: (exception, stackTrace) => SizedBox(),
      ),
      title: Text(
        "Padeiro",
        style: CustomStyle.medium,
      ),
      subtitle: Text(
        "Entrega em domicílio",
        style: CustomStyle.little,
      ),
      trailing: Icon(CupertinoIcons.forward, color: CustomColors.primaryColor,),
    );
  }
}
