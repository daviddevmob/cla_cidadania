import 'package:cidadania_app/app/controllers/adm_controller.dart';
import 'package:cidadania_app/app/routes/route_name.dart';
import 'package:cidadania_app/app/widgets/default_button_widget.dart';
import 'package:cidadania_app/app/widgets/default_textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:routefly/routefly.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AdmController admController = AdmController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Observer(builder:(_)  => DefaultTextFieldWidget(
                  hintText: "Usuário",
                  controller: admController.user,
                  prefixIcon: CupertinoIcons.person,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Observer(builder:(_)  => DefaultTextFieldWidget(
                  hintText: "Senha",
                  obscureText: true,
                  controller: admController.password,
                  prefixIcon: Icons.password,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              DefaultButtonWidget(
                title: "Entrar",
                onTap: () async {
                 bool result = await admController.login(context: context);
                 if(result == true) return Routefly.replace(RouteName.adm_home);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}