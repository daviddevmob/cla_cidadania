import 'package:carousel_images/carousel_images.dart';
import 'package:cidadania_app/src/screens/view_photo_screen.dart';
import 'package:cidadania_app/src/styles/color_style.dart';
import 'package:cidadania_app/src/styles/text_style.dart';
import 'package:cidadania_app/src/widgets/contact_service_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
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
                  "Padeiro",
                  style: CustomStyle.title,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: CustomStyle.medium,
                ),
                SizedBox(
                  height: 15,
                ),
                CarouselImages(
                  scaleFactor: 0.3,
                  viewportFraction: .6,
                  listImages: [
                    "https://images.unsplash.com/photo-1504128668912-f893e6606db6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",
                    "https://images.unsplash.com/photo-1532635224-cf024e66d122?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",
                    "https://images.unsplash.com/photo-1515823808611-65fd8e56c71a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",
                    "https://images.unsplash.com/photo-1513844316321-dd2466411c4c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",
                    "https://images.unsplash.com/photo-1532460734809-e7f8475ca917?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1437&q=80"
                  ],
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
                ContactServiceWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
