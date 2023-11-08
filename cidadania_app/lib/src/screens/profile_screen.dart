import 'dart:convert';
import 'package:cidadania_app/src/controllers/business_controller.dart';
import 'package:cidadania_app/src/models/business_model.dart';
import 'package:cidadania_app/src/repositories/converter.dart';
import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:cidadania_app/src/styles/text_style.dart';
import 'package:cidadania_app/src/widgets/contact_service_widget.dart';
import 'package:cidadania_app/src/widgets/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key,}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final BusinessController businessController = Get.find();
  late BusinessModel businessModel;
  bool loaded = false;

  getBusinessModel() async {
    int id = int.parse(Get.parameters["id"] as String);
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
            Get.back();
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
                CircleAvatar(
                      backgroundImage: businessModel.image == null
                      ? null
                      : MemoryImage(ConverterRepository.base64ToBytes(image: businessModel.image!)),
                      radius: 100,
                    ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  businessModel.name,
                  style: CustomStyle.title,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                 businessModel.description ?? "",
                  style: CustomStyle.medium,
                ),
                SizedBox(
                  height: 15,
                ),
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
                    items: businessModel.images.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Card(
                            elevation: 5,
                            child: Container(
                              width: 300,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: CustomColors.cardBackgroud,
                                image: DecorationImage(
                                  image: MemoryImage(base64Decode(i)),
                                  fit: BoxFit.contain,
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
                  whatsApp: businessModel.whatsapp,
                  instagram: businessModel.instagram,
                  phone: businessModel.phone,
                  map: businessModel.mapsLink,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
