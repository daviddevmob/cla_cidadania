import 'package:cidadania_app/app/controllers/business_controller.dart';
import 'package:cidadania_app/app/widgets/custom_header/custom_header_desktop.dart';
import 'package:cidadania_app/app/widgets/custom_header/custom_header_mobile.dart';
import 'package:cidadania_app/app/widgets/custom_list_business_model.dart';
import 'package:cidadania_app/app/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class AdmHomeScreen extends StatefulWidget {
  const AdmHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdmHomeScreen> createState() => _AdmHomeScreenState();
}

class _AdmHomeScreenState extends State<AdmHomeScreen> {
  final BusinessController businessController = GetIt.I.get<BusinessController>();
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(Responsive.isMobile(context) || Responsive.isSmallTablet(context))
                  CustomHeaderMobile()
                else 
                  CustomHeaderDesktop(),
                Observer(builder:(_) {
                  if(!businessController.loadAllBusiness){
                    return CircularProgressIndicator.adaptive();
                  } else {
                    return CustomListBusinessModel(isAdm: true,);
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
