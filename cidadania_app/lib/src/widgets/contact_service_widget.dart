import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:cidadania_app/src/models/business_model.dart';
import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:cidadania_app/src/styles/text_style.dart';
import 'package:cidadania_app/src/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactServiceWidget extends StatelessWidget {
  final String? whatsApp;
  final String? instagram;
  final String? phone;
  final String? map;
  const ContactServiceWidget({
    Key? key,
    this.whatsApp,
    this.instagram,
    this.phone,
    this.map,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (Responsive.isDesktop(context) || Responsive.isLaptop(context)) ? 400 : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: whatsApp == null
            ? null
            : () async {  
              try{
                Uri uri = Uri.parse("https://api.whatsapp.com/send/?phone=$whatsApp");
              await launchUrl(uri);
              }catch(e){
                
              }
            },
            child: Column(
              children: [
                Icon(
                  BootstrapIcons.whatsapp,
                  color: whatsApp == null ? null : CustomColors.primaryColor,
                  size: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Whatsapp",
                  style: CustomStyle.medium.copyWith(
                    color: whatsApp == null ? null : CustomColors.primaryColor,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: instagram == null
            ? null
            : () async {  
              try{
                Uri uri = Uri.parse("$instagram");
              await launchUrl(uri);
              }catch(e){
    
              }
            },
            child: Column(
              children: [
                Icon(
                  BootstrapIcons.instagram,
                  color: instagram == null ? null : CustomColors.primaryColor,
                  size: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Instagram",
                  style: CustomStyle.medium.copyWith(
                    color: instagram == null ? null : CustomColors.primaryColor,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: phone == null
            ? null
            : () async {  
              try{
                Uri uri = Uri.parse("tel:$phone");
              await launchUrl(uri);
              }catch(e){
    
              }
            },
            child: Column(
              children: [
                Icon(
                  Icons.phone,
                  size: 30,
                  color: phone == null ? null : CustomColors.primaryColor,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Telefone",
                  style: CustomStyle.medium.copyWith(
                    color: phone == null ? null : CustomColors.primaryColor,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: map == null
            ? null
            : () async {  
              try{
                Uri uri = Uri.parse("$map");
              await launchUrl(uri);
              }catch(e){
    
              }
            },
            child: Column(
              children: [
                Icon(
                  Icons.map,
                  size: 30,
                  color: map == null ? null : CustomColors.primaryColor,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Localização",
                  style: CustomStyle.medium.copyWith(
                    color: map == null ? null : CustomColors.primaryColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
