import 'package:cidadania_app/app/routes/route_name.dart';
import 'package:cidadania_app/app/styles/text_style.dart';
import 'package:cidadania_app/app/widgets/default_button_widget.dart';
import 'package:cidadania_app/app/widgets/search_business_widget.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class CustomHeaderMobile extends StatelessWidget {
  const CustomHeaderMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Olá, Administrador do Coletivo Alpha!",
          style: CustomStyle.medium,
        ),
        SizedBox(
          height: 20,
        ),
        DefaultButtonWidget(
          title: "Adicionar novo negócio",
          onTap: (){
            Routefly.push(RouteName.adm_business);
          },
        ),
        SizedBox(
          height: 20,
        ),
        SearchBusinessWidget(),
      ],
    );
  }
}