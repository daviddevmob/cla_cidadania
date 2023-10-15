import 'package:cidadania_app/src/controllers/adm_controller.dart';
import 'package:cidadania_app/src/routes/route_name.dart';
import 'package:cidadania_app/src/screens/adm/adm_home_screen.dart';
import 'package:cidadania_app/src/widgets/default_button_widget.dart';
import 'package:cidadania_app/src/widgets/default_textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              Obx(
                () => DefaultTextFieldWidget(
                  hintText: "Usuário",
                  controller: admController.user.value,
                  prefixIcon: CupertinoIcons.person,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => DefaultTextFieldWidget(
                  hintText: "Senha",
                  obscureText: true,
                  controller: admController.password.value,
                  prefixIcon: Icons.password,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              DefaultButtonWidget(
                title: "Entrar",
                onTap: () async {
                 bool result = await admController.login();
                 if(result == true) return Get.toNamed(RouteName.adm_home);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}