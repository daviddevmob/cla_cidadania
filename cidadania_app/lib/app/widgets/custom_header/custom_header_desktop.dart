import 'package:cidadania_app/app/controllers/adm_controller.dart';
import 'package:cidadania_app/app/routes/route_name.dart';
import 'package:cidadania_app/app/styles/color_style.dart';
import 'package:cidadania_app/app/styles/text_style.dart';
import 'package:cidadania_app/app/widgets/default_button_widget.dart';
import 'package:cidadania_app/app/widgets/search_business_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:routefly/routefly.dart';

class CustomHeaderDesktop extends StatelessWidget {
  const CustomHeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
  final AdmController admController = GetIt.I.get<AdmController>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Olá, Administrador do Coletivo Alpha!",
              style: CustomStyle.title,
            ),
            Spacer(),
            DefaultButtonWidget(
              title: "Adicionar negócio",
              onTap: (){
                Routefly.navigate(RouteName.adm_business);
              },
              customColor: CustomColors.textColor,
            ),
            SizedBox(
              width: 10,
            ),
            DefaultButtonWidget(
              title: "Ver como cliente",
              onTap: () async {
                Routefly.navigate(RouteName.home);
              },
              customColor: CustomColors.textColor,
            ),
            SizedBox(
              width: 10,
            ),
            DefaultButtonWidget(
              title: "Sair do Modo Administrador",
              onTap: () async {
                await admController.localDB.updateData(data: false, key: "adm_mode");
                Routefly.navigate(RouteName.home);
              },
              customColor: CustomColors.textColor,
            ),
          ],
        ),
        SearchBusinessWidget(),
      ],
    );
  }
}