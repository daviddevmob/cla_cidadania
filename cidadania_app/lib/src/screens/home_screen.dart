import 'package:cidadania_app/src/controllers/home_controller.dart';
import 'package:cidadania_app/src/routes/route_name.dart';
import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:cidadania_app/src/styles/text_style.dart';
import 'package:cidadania_app/src/widgets/tile_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = HomeController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 110, // Set this height
          flexibleSpace: Container(
            color: CustomColors.cardBackgroud,
            child: Column(children: <Widget>[
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                SizedBox(width: 15),
                Text(
                  "Coletivo Alpha",
                  style: CustomStyle.title.copyWith(
                    color: CustomColors.primaryColor,
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: (){
                    Get.toNamed(RouteName.login);
                  }, child: Text(
                    "Entrar",
                    style: CustomStyle.medium.copyWith(
                      color: CustomColors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(width: 15),
              ]),
              SizedBox(height: 8),
              Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Obx(
                    () => TextField(
                      textAlign: TextAlign.center,
                      controller: homeController.searchController.value,
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
                          hintText: "Pesquisar"),
                    ),
                  )),
            ]),
          ),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: 50,
          physics: ScrollPhysics(),
          itemBuilder: (context, index) => TileServiceWidget(),
        ),
      ),
    );
  }
}
