import 'package:cidadania_app/app/controllers/business_controller.dart';
import 'package:cidadania_app/app/styles/color_style.dart';
import 'package:cidadania_app/app/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class SearchBusinessWidget extends StatelessWidget {
  const SearchBusinessWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    final BusinessController businessController = GetIt.I.get<BusinessController>();
    return  Container(
                  height: 40,
                  width: (Responsive.isDesktop(context) || Responsive.isLaptop(context)) ? 400 : null,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Observer(builder:(_) => TextField(
                      textAlign: TextAlign.center,
                      controller: businessController.searchController,
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