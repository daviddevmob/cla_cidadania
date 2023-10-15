import 'package:carousel_images/carousel_images.dart';
import 'package:cidadania_app/src/controllers/business_controller.dart';
import 'package:cidadania_app/src/models/business_model.dart';
import 'package:cidadania_app/src/screens/view_photo_screen.dart';
import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:cidadania_app/src/styles/text_style.dart';
import 'package:cidadania_app/src/widgets/contact_service_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  final int businessId;
  const ProfileScreen({Key? key, required this.businessId}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final BusinessController businessController = Get.find();
  late BusinessModel businessModel;
  bool loaded = false;

  getBusinessModel() async {
    businessModel = await businessController.getOnlyBusiness(businessId: widget.businessId);
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
                  radius: 100,
                  backgroundColor: CustomColors.primaryColor,
                  backgroundImage: NetworkImage(
                    "https://plus.unsplash.com/premium_photo-1675604221054-6d1216f650a6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80",
                  ),
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
                CarouselImages(
                  scaleFactor: 0.3,
                  viewportFraction: .6,
                  listImages: businessModel.images,
                  height: 250,
                  borderRadius: 30.0,
                  cachedNetworkImage: true,
                  verticalAlignment: Alignment.topLeft,
                  onTap: (index) {
                    Get.to(
                      () => ViewPhotoScreen(
                        url:
                            "https://images.unsplash.com/photo-1504128668912-f893e6606db6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",
                      ),
                    );
                  },
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
