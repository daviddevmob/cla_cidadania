import 'dart:convert';
import 'package:cidadania_app/app/controllers/business_controller.dart';
import 'package:cidadania_app/app/models/business_model.dart';
import 'package:cidadania_app/app/repositories/converter.dart';
import 'package:cidadania_app/app/repositories/load_overlay.dart';
import 'package:cidadania_app/app/routes/route_name.dart';
import 'package:cidadania_app/app/styles/color_style.dart';
import 'package:cidadania_app/app/styles/text_style.dart';
import 'package:cidadania_app/app/widgets/contact_service_widget.dart';
import 'package:cidadania_app/app/widgets/default_return_page_widget.dart';
import 'package:cidadania_app/app/widgets/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:routefly/routefly.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key,}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final BusinessController businessController = GetIt.I.get<BusinessController>();
  BusinessModel? businessModel;
  bool loaded = false;

  getBusinessModel() async {
    String id = Routefly.query["profile_id"] as String;
    businessModel = await businessController.getOnlyBusiness(businessId: id);
    loaded = true;
    setState(() {
      
    });
  }
  @override
  void initState() {
    getBusinessModel();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Routefly.navigate(RouteName.home);
          },
          icon: Icon(
            CupertinoIcons.back,
            color: CustomColors.primaryColor,
          ),
        ),
        title: Text(
          "Perfil do Négocio",
          style: CustomStyle.title.copyWith(
            color: CustomColors.primaryColor,
          ),
        ),
      ),
      body: loaded == false
      ? Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator.adaptive()
          ),
      )
      : businessModel == null
      ? Padding(
        padding:  EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: DefaultReturnPageWidget(
          onTap: (){
            Routefly.navigate(RouteName.home);
          },
        ),
      )
      : SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap:businessModel!.image == null
                  ? null
                  : (){
                    LoadOverlay.showImage(url: businessModel!.image!, context: context);
                  },
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: businessModel!.image == null
                        ? null
                        : DecorationImage(
                          image: MemoryImage(
                            ConverterRepository.base64ToBytes(image: businessModel!.image!),
                          ),
                          fit: BoxFit.fitHeight,
                        ),
                        shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  businessModel!.name,
                  style: CustomStyle.title,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: (Responsive.isDesktop(context) || Responsive.isLaptop(context)) ? 600 : null,
                  child: Text(
                   businessModel!.description ?? "",
                    style: CustomStyle.medium,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                if(businessModel!.images.isNotEmpty)
                Container(
                  width: (Responsive.isDesktop(context) || Responsive.isLaptop(context)) ? 300 : null,
                  child: FlutterCarousel(
                    options: CarouselOptions(
                      height: 300, 
                      showIndicator: true,
                      slideIndicator: CircularSlideIndicator(
                        currentIndicatorColor: CustomColors.primaryColor,
                        indicatorBackgroundColor: CustomColors.cardBackgroud,
                      ),
                    ),
                    items: businessModel!.images.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Card(
                            elevation: 5,
                            child: InkWell(
                              onTap: (){
                                LoadOverlay.showImage(url: i, context: context);
                              },
                              child: Container(
                                width: 300,
                                padding: EdgeInsets.symmetric(vertical: 3.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: CustomColors.cardBackgroud,
                                  image: DecorationImage(
                                    image: MemoryImage(base64Decode(i)),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Formas de Contato",
                  textAlign: TextAlign.start,
                  style: CustomStyle.medium.copyWith(
                    color: CustomColors.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ContactServiceWidget(
                  whatsApp: businessModel!.whatsapp,
                  instagram: businessModel!.instagram,
                  phone: businessModel!.phone,
                  map: businessModel!.mapsLink,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
