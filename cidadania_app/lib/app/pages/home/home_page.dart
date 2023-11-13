import 'package:cidadania_app/app/controllers/business_controller.dart';
import 'package:cidadania_app/app/styles/color_style.dart';
import 'package:cidadania_app/app/styles/text_style.dart';
import 'package:cidadania_app/app/widgets/custom_list_business_model.dart';
import 'package:cidadania_app/app/widgets/search_business_widget.dart';
import 'package:cidadania_app/main.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final BusinessController businessController = autoInjector.get<BusinessController>(key: 'business');
  @override
  void initState() {
    businessController.getAllBusiness();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 122, // Set this height
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
                SizedBox(width: 15),
              ]),
              SizedBox(height: 8),
              SearchBusinessWidget(),
            ]),
          ),
        ),
        body: CustomListBusinessModel(isAdm: false,),
      ),
    );
  }
}
