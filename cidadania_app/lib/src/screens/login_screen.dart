import 'package:cidadania_app/src/routes/route_name.dart';
import 'package:cidadania_app/src/widgets/default_button_widget.dart';
import 'package:cidadania_app/src/widgets/default_textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              DefaultTextFieldWidget(
                hintText: "E-mail",
                prefixIcon: CupertinoIcons.mail,
              ),
              SizedBox(
                height: 20,
              ),
              DefaultTextFieldWidget(
                hintText: "Senha",
                obscureText: true,
                prefixIcon: Icons.password,
              ),
              SizedBox(
                height: 40,
              ),
              DefaultButtonWidget(
                title: "Entrar",
                onTap: (){
                  Get.toNamed(RouteName.adm_home);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}