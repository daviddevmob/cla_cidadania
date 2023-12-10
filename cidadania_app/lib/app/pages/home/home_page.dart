import 'package:cidadania_app/app/controllers/adm_controller.dart';
import 'package:cidadania_app/app/controllers/business_controller.dart';
import 'package:cidadania_app/app/routes/route_name.dart';
import 'package:cidadania_app/app/styles/color_style.dart';
import 'package:cidadania_app/app/styles/text_style.dart';
import 'package:cidadania_app/app/widgets/custom_list_business_model.dart';
import 'package:cidadania_app/app/widgets/search_business_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:routefly/routefly.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final BusinessController businessController = GetIt.I.get<BusinessController>();
  final AdmController admController = GetIt.I.get<AdmController>();
  @override
  void initState() {
    businessController.getAllBusiness();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.backgroudColor,
        appBar: AppBar(
          toolbarHeight: 122, 
          automaticallyImplyLeading: false,
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
                IconButton(
                  onPressed: () async {
                    bool login = await admController.login(context: context);
                    if(login == true) return Routefly.navigate(RouteName.adm_home);
                  }, 
                  icon: Icon(
                    Icons.admin_panel_settings,
                  ),
                ),
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
