import 'package:flutter/material.dart';

class AdmHomeScreen extends StatelessWidget {
  const AdmHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("Olá, Administrador")
          ],
        ),
      ),
    );
  }
}
