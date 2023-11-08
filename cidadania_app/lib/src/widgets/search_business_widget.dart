import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:cidadania_app/src/controllers/business_controller.dart';
import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:cidadania_app/src/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBusinessWidget extends StatelessWidget {
  const SearchBusinessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BusinessController businessController = Get.find();
    return  Container(
                  height: 40,
                  width: (Responsive.isDesktop(context) || Responsive.isLaptop(context)) ? 400 : null,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Obx(
                    () => TextField(
                      textAlign: TextAlign.center,
                      controller: businessController.searchController.value,
                      onChanged: (value){
                        businessController.changeSearch();
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search, color: CustomColors.primaryColor),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          hintStyle: new TextStyle(color: CustomColors.primaryColor),
                          hintText: "Pesquisar Negócio"),
                    ),
     )
    );
  }
}