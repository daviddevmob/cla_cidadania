import 'package:cidadania_app/src/controllers/business_controller.dart';
import 'package:cidadania_app/src/screens/adm/adm_business_screen.dart';
import 'package:cidadania_app/src/styles/text_style.dart';
import 'package:cidadania_app/src/widgets/default_button_widget.dart';
import 'package:cidadania_app/src/widgets/tile_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdmHomeScreen extends StatefulWidget {
  const AdmHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdmHomeScreen> createState() => _AdmHomeScreenState();
}

class _AdmHomeScreenState extends State<AdmHomeScreen> {
  final BusinessController businessController = Get.find();
  @override
  void initState() {
    businessController.getAllBusiness();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Olá, Administrador do Coletivo Alpha!",
                style: CustomStyle.medium,
              ),
              SizedBox(
                height: 10,
              ),
              DefaultButtonWidget(
                title: "Adicionar novo negócio",
                onTap: (){
                  Get.to(() =>AdmBusinessScreen());
                },
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() {
                if(!businessController.loadAllBusiness.value){
                  return CircularProgressIndicator.adaptive();
                } else {
                  return Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      itemCount: businessController.businessSearch.length,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) => TileServiceWidget(businessModel: businessController.businessSearch[index],isAdm: true,),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
