import 'package:cidadania_app/src/controllers/business_controller.dart';
import 'package:cidadania_app/src/widgets/card_service_widget.dart';
import 'package:cidadania_app/src/widgets/responsive.dart';
import 'package:cidadania_app/src/widgets/tile_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListBusinessModel extends StatelessWidget {
  final bool isAdm;
  const CustomListBusinessModel({super.key, required this.isAdm});

  @override
  Widget build(BuildContext context) {
    final BusinessController businessController = Get.find();
    if(Responsive.isDesktop(context) || Responsive.isLaptop(context) ){
      return Obx(
        (){
          return GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (MediaQuery.of(context).size.width ~/ 250).toInt()),
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: businessController.businessSearch.map((business){
              return CardServiceWidget(businessModel: business, isAdm: isAdm,);
            }).toList(),
          );
        }
      );
    }
    return Obx(
          () => ListView.builder(
            shrinkWrap: true,
            itemCount: businessController.businessSearch.length,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) => TileServiceWidget(businessModel: businessController.businessSearch[index], isAdm: isAdm,),
          ),
        );
  }
}