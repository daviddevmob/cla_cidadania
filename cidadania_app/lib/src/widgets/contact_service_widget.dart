import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:cidadania_app/src/styles/text_style.dart';
import 'package:flutter/material.dart';

class ContactServiceWidget extends StatelessWidget {
  final String? whatsApp;
  final String? instagram;
  final String? phone;
  const ContactServiceWidget({
    Key? key,
    this.whatsApp,
    this.instagram,
    this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Icon(
                BootstrapIcons.whatsapp,
                size: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Whatsapp",
                style: CustomStyle.medium,
              )
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Icon(
                BootstrapIcons.instagram,
                size: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Instagram",
                style: CustomStyle.medium,
              )
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Icon(
                Icons.phone,
                size: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Telefone",
                style: CustomStyle.medium,
              )
            ],
          ),
        ),
      ],
    );
  }
}
