import 'package:cidadania_app/app/controllers/business_controller.dart';
import 'package:cidadania_app/app/widgets/card_service_widget.dart';
import 'package:cidadania_app/app/widgets/responsive.dart';
import 'package:cidadania_app/app/widgets/tile_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CustomListBusinessModel extends StatelessWidget {
  final bool isAdm;
  const CustomListBusinessModel({super.key, required this.isAdm});

  @override
  Widget build(BuildContext context) {
    final BusinessController businessController = GetIt.I.get<BusinessController>();
    if(Responsive.isDesktop(context) || Responsive.isLaptop(context) ){
      return Observer(builder:(_) {
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
    return Observer(builder:(_)  => ListView.builder(
            shrinkWrap: true,
            itemCount: businessController.businessSearch.length,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) => TileServiceWidget(businessModel: businessController.businessSearch[index], isAdm: isAdm,),
          ),
        );
  }
}